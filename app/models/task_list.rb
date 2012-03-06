class TaskList < ActiveRecord::Base
  attr_accessible :name
  
  has_many :assignments, :as => :assignable, :dependent => :delete_all
  has_many :tasks, :through => :assignments
  has_and_belongs_to_many :users

  Assignment.class_eval { scope :task_lists, where(:assignable_type => 'TaskList') }
  Task.class_eval { def task_lists; assignments.task_lists.map(&:assignable); end }

  validates :name, :presence => true, :length => {:maximum => 255}
end
