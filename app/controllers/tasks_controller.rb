class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)

		if @task.save
			redirect_to project_path(@task.project_id), notice: "Successfully Updated"			
		end
	end

	private

	def task_params
		params[:task].permit(:title, :due_date, :project_id, :is_completed)
	end
end
