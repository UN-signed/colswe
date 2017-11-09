require 'faker'

FactoryGirl.define do
  factory :research_group do |f|
    f.name {Faker::Name.first_name}
    f.description {Faker::ChuckNorris.fact }
    f.administrator_id {Faker::Number.between(0, 15)}
  end
end
