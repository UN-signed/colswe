namespace :db do
  desc "Populate Members"
  task :populate => :environment do
  require 'faker'
  # Rake::Task['db:reset'].invoke
  #
  #   20.times do
  #     Tag.create do |t|
  #       t.name = Faker::DragonBall.character
  #     end
  #   end
  #
  #   20.times do
  #     ResearchGroup.create do |group|
  #       group.name = Faker::GameOfThrones.dragon
  #       group.description = Faker::Lorem.paragraph
  #       group.project_id = rand(100)
  #     end
  #   end
  #
  #   100.times do
  #     Project.create do |project|
  #       project.name = Faker::GameOfThrones.dragon
  #       project.state = 'Activo'
  #       project.summary = Faker::Lorem.paragraph
  #       project.git = Faker::Internet.url('github.com')
  #       project.research_group_id = rand(20)
  #       # project.project_tag_id=
  #     end
  #   end


    #User.create(:id => i, :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password', :research_group_id => rand(20))

    150.times do
      Member.create do |member|
        member.role = 'Member'
        member.user_id = rand(100)
        member.project_id = rand(100)
        member.research_group_id = rand(20)
      end
    end
  end
end
