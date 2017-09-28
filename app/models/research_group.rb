class ResearchGroup < ApplicationRecord
  has_many :users
  has_many :members
  has_many :projects
end
