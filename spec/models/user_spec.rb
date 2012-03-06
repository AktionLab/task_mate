require 'spec_helper'

restricted_user_alias_names = %w(sign_in sign_out sign_up users tasks about contact contact_us admin)
describe User do
  describe 'factories' do
    it 'should have a valid default factory' do
      Factory(:user)
      Factory(:user)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:alias_name) }
    it { should ensure_length_of(:first_name).is_at_most(255) }
    it { should ensure_length_of(:last_name).is_at_most(255) }
    it { should ensure_length_of(:alias_name).is_at_most(255) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:last_name) }
    it { should allow_mass_assignment_of(:alias_name) }
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
    it { should_not allow_mass_assignment_of(:encrypted_password) }
    it { should_not allow_mass_assignment_of(:reset_password_token) }
    it { should_not allow_mass_assignment_of(:reset_password_sent_at) }
    it { should_not allow_mass_assignment_of(:remember_created_at) }
    it { should_not allow_mass_assignment_of(:sign_in_count) }
    it { should_not allow_mass_assignment_of(:current_sign_in_at) }
    it { should_not allow_mass_assignment_of(:last_sign_in_at) }
    it { should_not allow_mass_assignment_of(:current_sign_in_ip) }
    it { should_not allow_mass_assignment_of(:last_sign_in_ip) }

    context 'uniqueness' do
      before(:each) { Factory(:user) }
      it { should validate_uniqueness_of(:alias_name).case_insensitive }
    end

    it 'should reject aliases from a select list' do
      restricted_user_alias_names.each do |word|
        factory = Factory.build(:user, :alias_name => word)
        factory.should_not be_valid
      end
    end
  end

  describe 'associations' do
    it { should have_many(:assignments) }
    it { should have_many(:tasks) }
    it { should have_and_belong_to_many(:task_lists) }

    it 'should remove all assignments when deleted' do
      assignment = Factory(:assignment)
      expect { assignment.assignable.destroy }.to change { Assignment.count }.by(-1)
    end

    it 'should add a users scope to assignments' do
      user1 = Factory.create(:user)
      user2 = Factory.create(:user)
      task_list = Factory.create(:task_list)
      task = user1.tasks.create! Factory.attributes_for(:task)
      task_list.tasks << task
      user2.tasks << task
      task.assignments.users.should == [user1.assignments.first,user2.assignments.first]
    end

    it 'should add a users method to task' do
      user1 = Factory.create(:user)
      user2 = Factory.create(:user)
      task = user1.tasks.create! Factory.attributes_for(:task)
      user2.tasks << task
      task.users.should == [user1,user2]
    end
  end
end

