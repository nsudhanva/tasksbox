class User < ActiveRecord::Base

	has_many :clients 
	has_many :projects 
	has_many :categories
	has_many :announcements
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         #def is_admin?
         #	if current_user.role == "admin" - cannot access current_user in models
         #		return true
         #	end
         #end

         def is_admin?
         	return true if self.role == "admin"
         end

end
