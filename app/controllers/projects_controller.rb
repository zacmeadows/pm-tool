class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index 
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search]).order(:id)
    else
      @projects = Project.all.order(:id)
    end
  end  

  def new
    @project = Project.new 
  end 

  def create
    @project = Project.new project_params
    @project.user = current_user
    if @project.save
      redirect_to projects_path
    else 
      render :new
    end 
  end 

  def edit 
    @project = Project.find params[:id]
  end 

  def update 
    @project = Project.find params[:id]
      if @project.update project_params
        redirect_to projects_path
      else 
        render :edit
      end 
  end 

  def destroy
    @project = Project.find params[:id]
    @project.destroy 
    redirect_to projects_path
  end 

  def show
    @project = Project.find params[:id]
    @task = Task.new
    @discussion = Discussion.new
  end


  private 

    def project_params
      params.require(:project).permit(:title, :description, :due_date, {projectmember_ids: []})
    end

end
