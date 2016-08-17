class ChangeUserIdToIntegerFromUsers < ActiveRecord::Migration
  def change
  	remove_column :categories, :integer, :user_id
  	add_column :categories, :user_id, :integer
  end
end
