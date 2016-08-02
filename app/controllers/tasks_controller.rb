class TasksController < ApplicationController

	def create 
		@task = Task.new(task_params)

		if @task.save
			redirect_to project_path(@task.project_id), notice: "Successfully Updated"			
		end
	end

	def mark_as_complete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: true)
		Notification.completed(task, current_user).deliver!
		redirect_to :back, notice: "Successfully completed the task"
	end

	def mark_as_incomplete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: false)
		Notification.incompleted(task, current_user).deliver!
		redirect_to :back, notice: "Task has been re-opened"
	end

	private

	def task_params
		params[:task].permit(:title, :due_date, :project_id, :is_completed)
	end
end
