class CommentsController < ApplicationController

  def create
    @discussion = Discussion.find params[:discussion_id] 
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.discussion_id = @discussion.id
    @comment.save
    redirect_to project_discussion_path(@discussion.project_id, @discussion)
  end 


  private 

  def comment_params
    params.require(:comment).permit(:body, :discussion_id)
  end

end