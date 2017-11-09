# == Schema Information
#
# Table name: research_groups
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  administrator_id :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ResearchGroup < ApplicationRecord
  has_many :members
  has_many :projects

  def self.getUsers(group_id)
    @members = Member.select('members.research_group_id, members.user_id, users.id').distinct
                     .joins(:user)
                     .where(:research_group_id => group_id)

    users = []
    @members.each do |member|
      user = User.find(member.user_id)
      users.push(user)
    end
    return users
  end

  def self.getAvailableUsers(group_id)
    users = []
    User.all.collect.each do |user|
      if !user.in?(self.getUsers(group_id))
        users.push(user)
      end
    end
    return users
  end

  def self.load_researh_groups(**args)
    paginate(page: args[:page] || 1, per_page: 12).reverse_order
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
