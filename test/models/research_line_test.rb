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

require 'test_helper'

class ResearchLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
