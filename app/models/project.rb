class Project < ActiveRecord::Base

	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories

	belongs_to :client
	has_many :tasks
	belongs_to :project

	validates_presence_of :name, :description, :start_date, :end_date, :client_id, :status, :estimated_budget
	validates_length_of :description, minimum: 10
	validates_numericality_of :client_id

	#custom validations
	validate :check_date
	
	def self.new_projects
		Project.where('status = ?', 'new')
	end

	private 
	def check_date
		if self.end_date <= self.start_date
			errors.add(:end_date, "Should be greater than start date")
		end
	end
end
