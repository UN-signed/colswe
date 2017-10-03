# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create 10 research_groups and research_areas
for i in 0..10
  ResearchGroup.create(name:Faker::Company.name, description:Faker::Hipster.sentence, administrator_id:rand(11))

  ResearchArea.create(name:Faker::Superhero.name,description:Faker::Lovecraft.sentences)
end

# Create 25 projects and 50 research_lines
for i in 0..25
  p = Project.create(name:Faker::Company.name, summary:Faker::Hipster.sentence, state:Faker::Boolean.boolean,
  research_group_id:rand(11), git:Faker::Internet.url('github.com'))

  ResearchLine.create(name:Faker::Superhero.power,description:Faker::Lovecraft.sentences, research_area_id: rand(25)+1)
  ResearchLine.create(name:Faker::Superhero.power,description:Faker::Lovecraft.sentences, research_area_id: rand(25)+1)
end

# Create 100 users and 100 members
for i in 0..100
  a = User.create(name:Faker::Name.name, description:Faker::Lovecraft.sentences, degree:Faker::Educator.course,
    github_username:Faker::Twitter.screen_name, departament:Faker::Superhero.power, email:Faker::Internet.email,
    research_group_id: rand(11)+1)

  #Member.create(role: Faker::Company.profession, user_id:i,research_group_id: a.research_group_id,
    #project_id: Project.find(a.research_group_id)[0].project_id)
    Member.create(role: Faker::Company.profession, user_id:i,research_group_id: a.research_group_id,
      project_id: rand(25)+1)
end
