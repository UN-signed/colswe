class WeeklyReportSubscriberMailer < ApplicationMailer
  default from: "smarthubcolswe@gmail.com"

	def email(subscriber)
    @user = User.find(subscriber.user_id)
    @project = Project.find(subscriber.project_id)
    @articles = Article.where("project_id = ? AND created_at >= ?", subscriber.project_id, Date.today.ago(86400))
    mail(to: @user.email, subject: 'Aquí está el reporte semanal del proyecto ' + @project.name)
  end
end
