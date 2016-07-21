class Task < ActiveRecord::Base
	belongs_to :project

	def details
		"#{self.title} - #{self.due_date} - #{self.is_completed}"
	end
end
