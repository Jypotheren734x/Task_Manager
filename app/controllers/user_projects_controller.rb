class UserProjectsController < ApplicationController
  def create
    @project = Project.find(params[:user_project][:project_id])
    params[:user_project][:users].each do |u|
      @project.user_projects.create(user_id: u)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @project = UserProject.where("project_id=#{params[:id]} and user_id=#{current_user.id}").first
    @project.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @project = UserProject.where("project_id=#{params[:id]} and user_id=#{current_user.id}").first
    @project.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
end
