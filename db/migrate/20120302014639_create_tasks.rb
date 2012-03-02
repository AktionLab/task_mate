class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :description
      t.datetime :started_at
      t.datetime :completed_at
      t.datetime :due_at
      t.string :state

      t.timestamps
    end
  end
end
