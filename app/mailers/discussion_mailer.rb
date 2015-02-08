class DiscussionMailer < ApplicationMailer

  def notify_discussion_owner(comment)
    @comment = comment
    @discussion = @comment.discussion
    @user = @discussion.user
    mail to: @user.email, subject: "You've got and answer!"
  end 

end
