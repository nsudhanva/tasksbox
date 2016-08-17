class Employee < ActiveRecord::Base
	before_create :generate_employee_code

	belongs_to :company
	belongs_to :department

	private
	def generate_employee_code
		self.code = "#{self.first_name[0..2]} - #{Employee.last.nil? ? 1 : Employee.last.id + 1}"
	end
end
