class RenameColumnBudgetFromProject < ActiveRecord::Migration
  def change

  	#rename_column :table_name, :old_column_name, :new_column_name
  	rename_column :projects, :budget, :estimated_budget

  	#change_column :table_name, :column_name, :new_datatype
 	change_column :projects, :estimated_budget, :float
  end
end
