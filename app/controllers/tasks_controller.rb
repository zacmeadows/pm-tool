class TasksController < ApplicationController

  before_action :authenticate_user!
  respond_to :js

  def create
    @project = Project.find params[:project_id]
    @task = @project.tasks.new task_params
    @task.user = current_user
    @task.status = false
    if @task.save
      respond_with ()
      # redirect_to project_path params[:project_id]
    else
      render "new"
    end 
  end 

  def edit 
    @task = Task.find params[:id]
    @project = @task.project
  end 

  def update 
    @task = Task.find params[:id]
      if @task.update task_params
        redirect_to project_path(@task.project)
      else
        render :edit
      end 
  end 

  def destroy
    @task = Task.find params[:id]
    @project = @task.project
    @task.destroy
    respond_with ()
    # redirect_to project_path(@project)
  end 

  def toggle_task
    @task = Task.find params[:id]
    @task.user = current_user
    if @task.status == true
      @task.status = false
    else  
      @task.status = true
    end 
      @task.save
      TaskMailer.task_completion_notification(@task).deliver_later
      redirect_to project_path(@task.project)
  end 

  private 

  def task_params
    params.require(:task).permit(:title, :due_date, :project_id, :body, :status)
  end

end
