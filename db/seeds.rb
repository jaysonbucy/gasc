require 'faker'

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6, 8)
  )
end

users = User.all

3.times do
  SwimForm.create!(
    description: Faker::Superhero.name,
    url: Faker::Internet.url,
    active: true,
    user: users.sample
  )
end

strokes = ['freestyle', 'backstroke', 'breaststroke', 'butterfly']
sex = ['male', 'female']
10.times do
  SwimEvents.create!(
    name: strokes.sample,
    distance_in_meters: Faker::Number.number(2),
    age_group_start: 13,
    age_group_end: 18,
    gender: sex.sample
  )
end

standard = User.create!(
  first_name: "Standard",
  last_name: "Userman",
  email: "standard@user.com",
  password: "testing01",
  role: "standard",
  image: "https://www.marathonsoftware.com.au/images/intro/basic.png"
)

admin = User.create!(
  first_name: "Admin",
  last_name: "Userman",
  email: "admin@user.com",
  password: "testing01",
  role: "admin",
  image: "https://www.gatorclean.net/images/gatormascot.png"
)

puts "Seed finshed"
puts "#{User.count} users created"
puts "#{SwimForm.count} swim forms created"
puts "#{SwimEvents.count} events created"
