class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :company
    	t.string :mobile
    	t.string :email
    	t.string :website

      	t.timestamps null: false
      	#t.datetime :created_at
      	#t.datetime :updated_at
    end
  end
end
