class DiscussionsController < ApplicationController
  
  def create
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.new discussion_params
    @discussion.save
    redirect_to project_path params[:project_id]
  end 

  def edit
    @discussion = Discussion.find params[:id]
    @project = @discussion.project
  end 

  def update 
    @discussion = Discussion.find params[:id]
      if @discussion.update discussion_params
        redirect_to project_path(@discussion.project)
      else
        render :edit
      end 
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @project = @discussion.project
    @discussion.destroy
    redirect_to project_path(@project)
  end 


  private 

  def discussion_params
    params.require(:discussion).permit(:title, :description, :project_id)
  end


end
