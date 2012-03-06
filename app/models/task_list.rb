class TaskList < ActiveRecord::Base
  attr_accessible :name
  
  has_assignments
  has_and_belongs_to_many :users

  validates :name, :presence => true, :length => {:maximum => 255}
end
