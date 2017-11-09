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
  belongs_to :project

  def self.vsTime(groupBy, project_id)
    if project_id
      data = Member.where(project_id: project_id).group(groupBy).count
    else
      data = Member.select(groupBy)
    end
    keys = data.keys
    keys.each_index do |i|
      if i != 0
        data[keys[i]] += data[keys[i-1]]
      end
    end
    return data
  end
end
