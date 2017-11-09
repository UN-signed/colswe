require 'faker'

FactoryGirl.define do
  factory :project do |f|
    f.name {Faker::Name.first_name}
    f.state {Faker::Boolean.boolean}
    f.summary {Faker::HeyArnold.quote}
    f.git {Faker::Internet.user_name}
    f.research_group_id {0}
  end
end
