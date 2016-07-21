class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :project_id
      t.datetime :due_date
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
