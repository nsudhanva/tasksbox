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

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(project_params)
			redirect_to project_path(@project.id), notice: "Successfully updated"
		else
			render action: "new"
		end
	end
	
	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to projects_path, notice: "Succesfully ceated"
		else
			render action: "new"
		end
	end

	def destroy
		@project = Project.find(params[:id])

		if @project.destroy
			redirect_to clients_path, notice: "Suvcessfully deleted"
		end
	end

	private 
		def project_params
			params[:project].permit(:name, :description, :start_date, :end_date, :status, :client_id, :estimated_budget)
			#Any data from form
		end
end
	