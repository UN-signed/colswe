# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  name          :string
#  key_words     :text
#  description   :text
#  language      :string
#  bibliography  :text
#  file_path     :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pdf           :string
#  project_id    :integer
#  html          :text
#  url           :string
#  uploader_type :string
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
