require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  let(:user) { Factory(:user) }
  let(:other_user) { Factory(:user) }
  let(:ability) { Ability.new(user) }

  subject { ability }

  context 'for tasks owned by user' do
    before(:each) { user.tasks.create! Factory.attributes_for(:task) }

    it { should be_able_to(:create, Task.new) }
    it { should be_able_to(:read, user.tasks.first) }
    it { should be_able_to(:update, user.tasks.first) }
    it { should be_able_to(:destroy, user.tasks.first) }
  end

  context 'for tasks owned by others' do
    before(:each) do
      other_user.tasks.create! Factory.attributes_for(:task)
    end

    it { should_not be_able_to(:show, other_user.tasks.first) }
    it { should_not be_able_to(:update, other_user.tasks.first) }
    it { should_not be_able_to(:destroy, other_user.tasks.first) }
  end

  context 'for task lists owned by user' do
    before(:each) { user.task_lists.create! Factory.attributes_for(:task_list) }

    it { should be_able_to(:create, TaskList.new) }
    it { should be_able_to(:read, user.task_lists.first) }
    it { should be_able_to(:update, user.task_lists.first) }
    it { should be_able_to(:destroy, user.task_lists.first) }
  end

  context 'for task lists owned by others' do
    before(:each) { other_user.task_lists.create! Factory.attributes_for(:task_list) }

    it { should_not be_able_to(:read, other_user.task_lists.first) }
    it { should_not be_able_to(:update, other_user.task_lists.first) }
    it { should_not be_able_to(:destroy, other_user.task_lists.first) }
  end

  context "own user" do
    it { should be_able_to(:show, user) }
  end

  context "other users" do
    it { should_not be_able_to(:show, other_user) }
  end
end
