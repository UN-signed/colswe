# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  name         :string
#  key_words    :text
#  description  :text
#  lenguage     :string
#  bibliography :text
#  file_path    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ApplicationRecord
end
