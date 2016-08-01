class ChangeUserIdToIntegerFromUsers < ActiveRecord::Migration
  def change
  	rename_column :categories, :integer, :user_id
  	change_column :categories, :user_id, :integer
  end
end
