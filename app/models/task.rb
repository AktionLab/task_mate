class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :due_at

  before_create :set_default_state

  has_many :assignments, :dependent => :delete_all

  validates :subject, :presence => true, :length => {:maximum => 255} 
  validates :description, :length => {:maximum => 1000}

  def new?
    state == 'new'
  end

  def cancelled?
    state == 'cancelled'
  end

  def completed?
    state == 'completed'
  end

  def expired?
    state == 'expired'
  end

  def complete!
    raise "Cannot complete cancelled task" if cancelled?
    raise "Cannot complete expired task" if expired?
    self.completed_at = DateTime.now
    self.state = 'completed'
    self.save
  end

  def cancel!
    raise "Cannot cancel completed task" if completed?
    raise "Cannot cancel expired task" if expired?
    self.state = 'cancelled'
    self.save
  end

  def expire!
    raise "Cannot exire completed task" if completed?
    raise "Cannot expire cancelled task" if cancelled?
    self.state = 'expired'
    self.save
  end

private
  
  def set_default_state
    self.state = 'new'
  end
end
