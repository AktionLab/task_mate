require 'spec_helper'

describe User do
  describe 'factories' do
    it 'should have a valid default factory' do
      Factory.build(:user).should be_valid
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

  end

  describe 'associations' do
    it { should have_many(:assignments) }
    it { should have_many(:tasks) }
  end
end

