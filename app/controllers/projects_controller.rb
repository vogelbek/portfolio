class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create params[:project].permit(:description)

    redirect_to projects_path
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy

    redirect_to projects_path
  end
end
