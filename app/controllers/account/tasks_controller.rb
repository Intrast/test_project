class Account::TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = project.id
    @task.save
    redirect_to account_project_path(project.id)
  end

  private

  def task_params
    params.require(:task).permit(:name, :text)
  end
end
