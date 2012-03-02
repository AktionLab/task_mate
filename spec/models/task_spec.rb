require 'spec_helper'

describe Task do
  describe 'factories' do
    it 'should have a valid default factory' do
      Factory.build(:task).should be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should ensure_length_of(:subject).is_at_most(255) }
    it { should ensure_length_of(:description).is_at_most(1000) }
    it { should allow_mass_assignment_of(:subject) }
    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:due_at) }
    it { should_not allow_mass_assignment_of(:state) }
    it { should_not allow_mass_assignment_of(:started_at) }
    it { should_not allow_mass_assignment_of(:completed_at) }
  end

  describe 'associations' do
    it { should have_many(:assignments) }
  end
end

