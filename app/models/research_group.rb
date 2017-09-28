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
  has_many :users
  has_many :members
  has_many :projects
end
