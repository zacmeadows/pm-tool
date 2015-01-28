class TasksController < ApplicationController

  # def index
  #   # @task = Task.all
  # end 

  # def new 
  #   # @task = Task.new
  # end 

  def create
    @project = Project.find params[:project_id] 
    @task = @project.tasks.new task_params
    if @task.save
      redirect_to project_path params[:project_id]
    else
      redirect_to :new
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
    redirect_to project_path(@project)
  end 

  private 

  def task_params
    params.require(:task).permit(:title, :due_date, :project_id, :body)
  end

end
