require 'spec_helper'

describe Task do
  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should ensure_length_of(:subject).is_at_most(255) }
    it { should ensure_length_of(:description).is_at_most(1000) }
    it { should_not allow_mass_assignment_of(:state) }
    it { should_not allow_mass_assignment_of(:started_at) }
    it { should_not allow_mass_assignment_of(:completed_at) }
  end
end
