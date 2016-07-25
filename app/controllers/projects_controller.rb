class ProjectsController < ApplicationController
	def index
		@projects = Project.all		
	end

	def new
		@project = Project.new		
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to projects_path, notice: "Succesfully ceated"
		else
			render action: "new"
		end
	end

	private 
		def project_params
			params[:project].permit(:name, :description, :start_date, :end_date, :status, :client_id, :estimated_budget)
			#Any data from form
		end
end
	