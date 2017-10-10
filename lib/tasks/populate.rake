namespace :db do
  desc "Erase and fill database"
	task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    # Create 15 posts
    100.times do
      Project.create do |project|
        project.name = Faker::Company.name
        project.state = "True"
        project.summary = Faker::Lorem.paragraphs(2)
        project.git = Faker::Internet.url('example.com')
      end

      ResearchGroup.create do |group|
        group.name = Faker::Company.name
        group.administrator_id = Faker::Number.number(2)
        group.description = Faker::Lorem.paragraphs(1)
        
      end
    end

      20.times do
        ResearchLine.create do |line|
          line.name = Faker::GameOfThrones.dragon
          line.description = Faker::Lorem.paragraphs(1)
        end
      end
  end
end
