require 'spec_helper'

describe Task do
  let(:task) { Factory(:task) }

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
    
    it 'should remove all assignments when deleted' do
      assignment = Factory(:assignment)
      expect { assignment.task.destroy }.to change { Assignment.count }.by(-1)
    end
  end

  describe 'state' do
    it 'by default is new' do
      task.state.should == 'new'
    end   

    it 'should return true for new? when state is new' do
      task.should be_new
    end

    it 'should return true for completed? when state is completed' do
      task.complete!
      task.reload
      task.should be_completed
    end

    it 'should return true for cancelled? when state is cancelled' do
      task.cancel!
      task.reload
      task.should be_cancelled
    end

    it 'transitions from new to completed' do
      task.complete!
      task.reload
      task.state.should == 'completed'
    end

    it 'transitions from new to cancelled' do
      task.cancel!
      task.reload
      task.state.should == 'cancelled'
    end

    it 'transitions from new to expired' do
      task.expire!
      task.reload
      task.state.should == 'expired'
    end

    it 'should not allow transition from completed to cancelled' do
      task.complete!
      expect {
        task.cancel!
      }.to raise_error(RuntimeError)
    end

    it 'should not allow transition from completed to expired' do
      task.complete!
      expect {
        task.expire!
      }.to raise_error(RuntimeError)
    end

    it 'should not allow transition from cancelled to completed' do
      task.cancel!
      expect {
        task.complete!
      }.to raise_error(RuntimeError)
    end

    it 'should not allow transition from cancelled to expired' do
      task.cancel!
      expect {
        task.expire!
      }.to raise_error(RuntimeError)
    end

    it 'should not allow transition from expired to completed' do
      task.expire!
      expect {
        task.complete!
      }.to raise_error(RuntimeError)
    end

    it 'should not allow transition from expired ot cancelled' do
      task.expire!
      expect {
        task.cancel!
      }.to raise_error(RuntimeError)
    end

    it 'should set the completed at time when completed' do
      task.complete!
      task.reload
      task.completed_at.should_not be_nil
    end
  end
end

