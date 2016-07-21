class TaskController < ApplicationController
  def tasks
  	@projects = Project.all
  	@tasks = Task.all
  end
end
