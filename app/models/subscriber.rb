# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Subscriber < ApplicationRecord
  belongs_to :project

  validates :id, :email, uniqueness: true
  validates :name, presence: true

  def self.create(args)
    new(args)
  end
  def self.searchById(subscriberId)
    find(subscriberId)
  end
  def self.searchByWhere(args)
    where(args)
  end
end
