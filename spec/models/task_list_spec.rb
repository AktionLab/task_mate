require 'spec_helper'

describe TaskList do
  describe 'factories' do
    it 'should have a valid default factory' do
      Factory.build(:task_list).should be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }
    it { should allow_mass_assignment_of(:name) }
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
  end

  describe 'associations' do
    it { should have_many(:assignments) }
    it { should have_many(:tasks) }
    it { should have_and_belong_to_many(:users) }

    it "should remove assignments when destroyed" do
      task_list = Factory(:task_list)
      task_list.tasks.create! Factory.attributes_for(:task)
      puts Assignment.count
      expect {
        task_list.destroy
      }.to change { Assignment.count }.by(-1)
      puts Assignment.count
      #raise 'foo'
    end

    it 'should add a task_lists scope to assignments' do
      task_list1 = Factory.create(:task_list)
      task_list2 = Factory.create(:task_list)
      user = Factory.create(:user)
      task = task_list1.tasks.create! Factory.attributes_for(:task)
      task_list2.tasks << task
      user.tasks << task
      task.assignments.task_lists.should == [task_list1.assignments.first,task_list2.assignments.first]
    end

    it 'should add a task_lists method to task' do
      task_list1 = Factory.create(:task_list)
      task_list2 = Factory.create(:task_list)
      task = task_list1.tasks.create! Factory.attributes_for(:task)
      task_list2.tasks << task
      task.task_lists.should == [task_list1,task_list2]
    end
  end
end
