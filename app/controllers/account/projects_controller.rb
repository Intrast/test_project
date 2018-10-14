class Account::ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to account_projects_path
  end

  def edit
    @project = Project.find_by(id: params[:id])

  end

  def update
    @project = Project.find_by(id: params[:id])
    @project.update(project_params)
    redirect_to account_projects_path
  end

  def show
    @project = Project.find_by(id: params[:id])
    @tasks = Task.where(project_id: params[:id])
  end

  def destroy
    @project = Project.find_by(id: params[:id])
    @project.destroy
    redirect_to account_projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
