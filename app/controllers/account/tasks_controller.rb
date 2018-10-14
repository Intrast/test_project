class Account::TasksController < ApplicationController
  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end


  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project_id = @project.id
    @task.save
    redirect_to account_projects_path
  end

  def edit

  end

  private

  def task_params
    params.require(:task).permit(:name, :text)
  end
end
