class Project < ApplicationRecord
  belongs_to :research_group
  has_and_belongs_to_many :research_line
end
