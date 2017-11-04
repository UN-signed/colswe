class NewSubscriberMailer < ApplicationMailer
  default from: 'smarthubcolswe@gmail.com'

  def welcome_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "Te has suscrito a" + @project.name)
  end
end
