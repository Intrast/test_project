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
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
    redirect_to account_projects_path
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to account_projects_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :text)
  end
end
