module ApplicationHelper
  def format_time(time, format=:long, blank_message="&nbsp;")
    time.blank? ? blank_message : time.to_s(format)
  end

  def short_description(desc)
    desc.length <= 170 ? desc : desc[0, 170] + ' ...'
  end
end
