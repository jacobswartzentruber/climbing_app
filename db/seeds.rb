# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

climber = Climber.new
climber.build_user(name: "Jake", email: "jake@example.com",
            password: "password", password_confirmation: "password",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
climber.save!

gym = Gym.new
gym.build_user(name: "Rock Gym", email: "rockgym@example.com",
            password: "password", password_confirmation: "password",
            activated: true,
            activated_at: Time.zone.now)
gym.save!

50.times do |n|
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