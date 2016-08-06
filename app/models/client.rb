class Client < ActiveRecord::Base

	has_many :projects
	belongs_to :user
	before_create :generate_client_code
	before_destroy :destroy_all_projects

	validates_presence_of :name, :company, :mobile, :email
	validates_length_of :mobile, is: 10
	validates_numericality_of :mobile
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :mobile, :email, scope: :user_id

	def details
		"#{self.name} <br> #{self.company} <br> #{self.mobile} - #{self.email}"
	end

	def list_projects
		Project.where('client_id = ?', self.id)
	end

	def list_by_status(status)
		Project.where('client_id = ? AND status = ?', self.id, status)
	end

	def generate_client_code
		self.code = "#{self.name[0..2]} - #{Client.last.nil? ? 1 : Client.last.id + 1}"
	end

	private
		def destroy_all_projects
			projects = Project.all.where('client_id = ?', self.id)
			projects.delete_all
		end
	
end
