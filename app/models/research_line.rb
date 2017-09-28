class ResearchLine < ApplicationRecord
  has_and_belongs_to_many :projects
  belongs_to :research_area
end
