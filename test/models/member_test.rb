# == Schema Information
#
# Table name: members
#
#  id                :integer          not null, primary key
#  role              :string
#  user_id           :integer
#  project_id        :integer
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
