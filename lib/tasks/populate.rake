namespace :db do
  desc "Populate Members"
  task :populate => :environment do
  require 'faker'

    150.times do
      Member.create do |member|
        member.role = 'Member'
        member.user_id = Faker::Number.number(2)
        member.project_id = Faker::Number.number(2)
        member.research_group_id = Faker::Number.number(2)
      end
    end
  end
end
