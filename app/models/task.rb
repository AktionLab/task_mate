class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :due_at

  validates :subject, :presence => true, :length => {:maximum => 255} 
  validates :description, :length => {:maximum => 1000}
end
