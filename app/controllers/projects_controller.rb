class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  end

  def create
    @group = Group.find(params[:project][:group_id])
    @project = @group.projects.create(project_params)
  end

  def update
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end

  def destroy
    @project = Project.find(params[:id])
    @project.group.projects.destroy(params[:id])
    @project.destroy
    redirect_to group_path(@project.group)
  end

  def project_params
    params.require(:project).permit(:title, :description, :group_id)
  end
end
