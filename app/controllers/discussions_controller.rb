class DiscussionsController < ApplicationController
  
  def create
    @project = Project.find params[:project_id]
    @discussion = @project.discussions.new discussion_params
    @discussion.user = current_user
    if @discussion.save
      redirect_to project_path params[:project_id]
    else
      render "new"
    end 
  end 

  # def create
  #  @project = Project.find params[:project_id]
  #  @discussion = Discussion.new params.require(:discussion).permit(:title, :description)
  #  @discussion.project_id = params[:project_id]
  #  @discussion.user = current_user

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

  def show 
    # render text: params 
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    @comment = Comment.new 
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
