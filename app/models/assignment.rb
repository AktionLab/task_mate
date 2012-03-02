class Assignment < ActiveRecord::Base
  belongs_to :assignable, :polymorphic => true
  belongs_to :task

  validates :assignable, :presence => true
  validates :task, :presence => true
end
