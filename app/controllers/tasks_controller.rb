class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
    @project = Project.new
  end

  def create
    if params[:task][:project_id].nil?
      @task = current_user.tasks.create(task_params)
    else
      @project = Project.find(params[:task][:project_id])
      @project.tasks.create(task_params)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if params[:task][:project_id]
      @task = Project.find(params[:task][:project_id]).tasks.find(params[:id])
      @task.update(task_params)
    else
      @task = current_user.tasks.find(params[:id])
      @task.update(task_params)
    end
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    current_user.tasks.delete(@task)
    @task.destroy
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :completed)
  end
end
