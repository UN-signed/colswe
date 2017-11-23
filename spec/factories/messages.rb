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

FactoryBot.define do
  factory :message do
    from_id 1
    to_id 1
    subject "MyString"
    message "MyText"
  end
end
