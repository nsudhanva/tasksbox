class ChangeUserIdToIntegerFromUsers < ActiveRecord::Migration
  def change
  	remove_column :categories, :user_id, :string
  	add_column :categories, :user_id, :integer
  end
end
