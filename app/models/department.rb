class Department < ActiveRecord::Base
	has_many :employees
end
