class Task < ActiveRecord::Base
	belongs_to :project

	validates_presence_of :title, :project_id, :due_date, :is_completed
	validates_length_of :title, minimum: 4

	validate :check_due_date #if !self.project.nil?

	def details
		"#{self.title} - #{self.due_date} - #{self.is_completed}"
	end

	def check_due_date
		if (self.due_date < self.project.start_date || self.due_date > self.project.end_date)
			errors.add(:due_date, "Should be greater than Project start date")
		end
	end 
end
