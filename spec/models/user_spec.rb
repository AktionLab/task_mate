require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should ensure_length_of(:first_name).is_at_most(255) }
    it { should ensure_length_of(:last_name).is_at_most(255) }
    it { should ensure_length_of(:alias).is_at_most(255) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:last_name) }
    it { should allow_mass_assignment_of(:alias) }
  end
end

