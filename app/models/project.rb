class Project < ActiveRecord::Base

	belongs_to :client
	has_many :tasks
	
	def self.new_projects
		Project.where('status = ?', 'new')
	end
end
