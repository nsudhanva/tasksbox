class AddColumnAddressToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address, :text
  end
end
