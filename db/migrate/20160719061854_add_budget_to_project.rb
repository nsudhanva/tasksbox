class AddBudgetToProject < ActiveRecord::Migration
  def change
  	#add_column :table_name, :column_name, :column_type
  	add_column :projects, :budget, :integer

  end
end
