class AddPersonalTaskListIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :personal_task_list_id, :integer
  end
end
