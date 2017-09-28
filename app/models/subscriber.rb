# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscriber < ApplicationRecord
  belongs_to :project
end
