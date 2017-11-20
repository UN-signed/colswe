class MessageMailer < ApplicationMailer
  default from: "smarthubcolswe@gmail.com"
  def new_message(message)
    @user = User.searchById(message.to_id)
    @message = message
    mail(to: @user.email, subject: message.subject)
  end
end
