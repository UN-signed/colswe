class WeeklyReportSubcriberJob < ApplicationJob
  queue_as :default

  def perform(subscriber)
    WeeklyReportSubscriberMailer.email(subscriber).deliver_now
  end
end
