class ProjectsController < ApplicationController

	before_action :authenticate_user!

	def index
		@projects = current_user.projects
		#@projects = Project.all		
	end

	def new
		@project = Project.new		
	end

	def show
		begin
			@project = current_user.projects.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to projects_path, notice: "Record NOt Found"
		end
	end

	def edit
		@project = current_user.projects.find(params[:id])
	end

	def update
		@project = current_user.projects.find(params[:id])

		if @project.update_attributes(project_params)
			redirect_to project_path(@project.id), notice: "Successfully updated"
		else
			render action: "new"
		end
	end
	
	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to projects_path, notice: "Succesfully ceated"
		else
			render action: "new"
		end
	end

	def destroy
		@project = Project.find(params[:id])

		if @project.destroy
			redirect_to clients_path, notice: "Sucessfully deleted"
		end
	end

	private 
		def project_params
			params[:project].permit(:name, :description, :start_date, :end_date, :status, :client_id, :estimated_budget)
			#Any data from form
		end
end
	