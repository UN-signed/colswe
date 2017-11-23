# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  state             :string           default("Pendiente")
#  summary           :text
#  git               :string
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'faker'

FactoryBot.define do
  factory :project do |f|
    f.name {Faker::Name.first_name}
    f.state {Faker::Boolean.boolean}
    f.summary {Faker::HeyArnold.quote}
    f.git {Faker::Internet.user_name}
    f.research_group_id {0}
  end
end
