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
end
