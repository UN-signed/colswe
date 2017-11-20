# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  from_id    :integer
#  to_id      :integer
#  subject    :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  
  validates :id, uniqueness: true
  validates :from_id, :to_id, :subject, :message, presence: true

  def self.getUserMessages(user_id)
    messages = where(to_id: user_id)
  end
end
