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
  #belongs_to :research_group
  has_and_belongs_to_many :research_lines
  has_and_belongs_to_many :tags
  has_many :subscribers
end
