class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :due_at

  has_many :assignments, :dependent => :delete_all

  validates :subject, :presence => true, :length => {:maximum => 255} 
  validates :description, :length => {:maximum => 1000}
end
