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
    respond_to do |format|
      format.html do
        redirect_to projects_path
      end
      format.js do
        unless @project.save
          render text:  @project.errors.full_messages.join,
                        status: :unprocessable_entity

        end
      end
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy

    redirect_to projects_path
  end
end
