# == Schema Information
#
# Table name: research_groups
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  administrator_id :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'faker'

FactoryBot.define do
  factory :research_group do |f|
    f.name {Faker::Name.first_name}
    f.description {Faker::ChuckNorris.fact }
    f.administrator_id {Faker::Number.between(0, 15)}
  end
end
