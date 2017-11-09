require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name {Faker::Name.first_name}
    f.password {"secrets1"}
    f.password_confirmation{"secrets1"}
    f.email {Faker::Name.last_name+"@gmail.com"}
    f.description {Faker::ChuckNorris.fact }
    f.degree {Faker::ChuckNorris.fact}
  end
end
