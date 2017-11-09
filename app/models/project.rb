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
  # belongs_to :research_area
  has_many :members
  has_many :subscribers
  has_many :articles
  #has_and_belongs_to_many :tags

  def self.getUsers(project_id)
    project = Project.find(project_id)
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

  def self.load_projects(**args)
    where(research_group_id: args[:research_group_id]).paginate(page: args[:page] || 1, per_page: 12).reverse_order
  end

  def self.create(args)
    new(args)
  end
  def self.searchById(projectId)
    find(projectId)
  end
  def self.searchByWhere(args)
    where(args)
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.getMembers(project_id)
    Member.where(project_id: project_id)
  end

  def self.getMembersDegree(project_id)
    User.joins(:members).where('project_id = ?',project_id).group(:degree).count
  end
end
