class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :assignable, :polymorphic => true
      t.references :task

      t.timestamps
    end
    add_index :assignments, [:assignable_id, :assignable_type]
    add_index :assignments, :task_id
  end
end
