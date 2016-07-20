class RemoveColumnWebsiteFromClients < ActiveRecord::Migration
  def change
  	#remove_column :table_name, :column_name
  	remove_column :clients, :website
  end
end
