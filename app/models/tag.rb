# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_and_belongs_to_many :projects
  def self.create(args)
    new(args)
  end
  def self.searchById(tagId)
    find(tagId)
  end
  def self.searchByWhere(args)
    where(args)
  end
end
