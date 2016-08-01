class User < ActiveRecord::Base

	has_many :clients 
	has_many :projects 
	has_many :categories
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
