# == Schema Information
#
# Table name: research_areas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResearchArea < ApplicationRecord
  has_many :research_line

  def self.create(args)
    new(args)
  end
  def self.searchById(researchAreaId)
    find(researchAreaId)
  end
  def self.searchByWhere(args)
    where(args)
  end
end
