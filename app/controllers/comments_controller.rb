class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @discussion = Discussion.find params[:discussion_id] 
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.discussion_id = @discussion.id
    @comment.save
    DiscussionMailer.notify_discussion_owner(@comment).deliver_later
    redirect_to project_discussion_path(@discussion.project_id, @discussion)
  end 


  private 

  def comment_params
    params.require(:comment).permit(:body, :discussion_id)
  end

end

  # def create
  #   @question = Question.find params[:question_id]
  #   @answer = @question.answers.new(answer_attributes)
  #   @answer.user = current_user
  #   if @answer.save
  #     # Answer.mailer.notify_question_owner(@answer).deliver
  #     AnswerMailer.notify_question_owner(@answer).deliver
  #     redirect_to @question, notice: "Answer created successfully."
  #   else
  #     render "/questions/show"
  #   end
  # end