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
    it { should have_many(:tasks) }
    it { should have_and_belong_to_many(:users) }
  end
end
