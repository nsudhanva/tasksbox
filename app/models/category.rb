class Category < ActiveRecord::Base
	belongs_to :users

	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :projects, through: :project_categories

	validates :name, presence: true
	#validates_presence_of :name
	
end
