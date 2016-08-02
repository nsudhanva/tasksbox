class ProjectsController < ApplicationController

	before_action :authenticate_user!

	def index
		if params[:status]
			@projects = current_user.projects.where('status = ?', params[:status])
		elsif params[:id]
			@projects = current_user.projects.where('client_id = ?', params[:id])
		else			
			@projects = current_user.projects
		#@projects = Project.all
		end
	end

	def new
		@project = Project.new		
	end

	def show
		@project = Project.find(params[:id])
		@task = Task.new
		@completed_tasks = @project.tasks.where('is_completed = ?', true)
		@incompleted_tasks = @project.tasks.where('is_completed = ?', false)
				
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
			params[:project].permit(:name, :description, :start_date, :end_date, :status, :client_id, :estimated_budget, category_ids: [])
			#Any data from form
		end
end
	