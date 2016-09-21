class RegistrationsController < Devise::RegistrationsController

	def index
		
	end

	def create
		
	end

	def new
		@user = User.new
	end

	def update
		
	end

	private

	def sign_up_params
		params[:user].permit(:email, :password, :password_confirmation, :role)
	end
end
