# == Schema Information
#
# Table name: members
#
#  id                :integer          not null, primary key
#  role              :string
#  user_id           :integer
#  project_id        :integer
#  research_group_id :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :research_group
end
