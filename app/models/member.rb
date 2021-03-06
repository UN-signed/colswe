# == Schema Information
#
# Table name: members
#
#  id                :integer          not null, primary key
#  role              :string
#  user_id           :integer
#  project_id        :integer
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :research_group
  belongs_to :project, optional: true
  validates :user_id, presence: true
  validates :research_group_id, presence: true

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
  def self.create(args)
    new(args)
  end
  def self.searchById(memberId)
    find(memberId)
  end
  def self.searchByWhere(args)
    where(args)
  end
  def self.research_groups(userId)
    select(:research_group_id).where(user_id: userId).distinct
  end
  def self.projectsIds(userId)
    select(:project_id).where(user_id: userId).distinct
  end
end
