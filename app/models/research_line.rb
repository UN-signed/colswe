# == Schema Information
#
# Table name: research_lines
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  research_area_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ResearchLine < ApplicationRecord
  has_and_belongs_to_many :projects
  belongs_to :research_area
end
