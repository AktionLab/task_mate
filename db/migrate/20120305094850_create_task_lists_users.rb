class CreateTaskListsUsers < ActiveRecord::Migration
  def change
    create_table :task_lists_users, :id => false do |t|
      t.references :task_list
      t.references :user
    end
  end
end
