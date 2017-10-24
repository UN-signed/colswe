# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  state             :boolean
#  summary           :text
#  git               :string
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :research_group
  has_and_belongs_to_many :research_lines
  has_many :members
  #has_and_belongs_to_many :tags
  has_many :subscribers

  def self.getUsers(project_id)
    project = Project.find(project_id)
    group = ResearchGroup.find(project.research_group_id)
    usersGroup = ResearchGroup.getUsers(group.id)
    membersProject = Member.select('members.project_id, members.user_id, users.id')
                     .joins(:user)
                     .where(:project_id => project_id)

    usersProject = []
    membersProject.each do |m|
      user = User.find(m.user_id)
      usersProject.push(user)
    end
    return usersProject
  end
end
