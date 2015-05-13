# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  climber = Climber.new
  climber.build_user(name: "Jake", email: "jake@example.com",
              password: "password", password_confirmation: "password",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)
  climber.save!
end

climber = Climber.new
climber.build_user(name: "Sandbox Climber", email: "sandboxClimber@example.com",
            password: "password", password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)
climber.save!

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  climber2 = Climber.new
  climber2.build_user(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
  climber2.save!
end

gym = Gym.new
gym.build_user(name: "Sandbox Gym", email: "sandboxGym@example.com",
            password: "password", password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)
gym.save!

10.times do |n|
  name  = Faker::Address.street_name
  difficulty = "V"+Faker::Number.digit.to_s
  color = "#FF0000"
  description = Faker::Lorem.sentence
  gym.routes.build(name:  name,
                   difficulty: difficulty,
                   color: color,
                   description: description)
  gym.save!
end