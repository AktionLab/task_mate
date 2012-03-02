require 'spec_helper'

describe Assignment do
  describe 'factories' do
    it 'should have a valid default factory' do
      Factory.build(:assignment).should be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:assignable) }
    it { should validate_presence_of(:task) }
  end
end
