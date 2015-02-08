class TaskMailer < ApplicationMailer

  def task_completion_notification(task)
    @task = task
    @user = @task.user
    @task.status 
    mail to: @user.email, subject: "Your task status has been updated!"
  end

end
