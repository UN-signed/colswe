class NewArticleMailer < ApplicationMailer
  default from: "smarthubcolswe@gmail.com"

	def new_article_email(subscriber, article)
    @article = article
    @subscriber = subscriber
    @user = User.find(subscriber.user_id)
    @project = Project.find(subscriber.project_id)
    mail(to: @user.email, subject: 'El proyecto ' + @project.name + 'ha publicado un nuevo articulo.')
  end
end
