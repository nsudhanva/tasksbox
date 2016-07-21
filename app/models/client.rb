class Client < ActiveRecord::Base

	has_many :projects

	def details
		"#{self.name} <br> #{self.company} <br> #{self.mobile} - #{self.email}"
	end

	def list_projects
		Project.where('client_id = ?', self.id)
	end

	def list_by_status(status)
		Project.where('client_id = ? AND status = ?', self.id, status)
	end
end
