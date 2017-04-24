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
genders = ['male', 'female']
distances = [25, 50, 100, 200]

10.times do
  SwimEvent.create!(
    name: strokes.sample,
    distance_in_yards: distances.sample,
    age_group_start: 13,
    age_group_end: 18,
    gender: genders.sample
  )
end

from = Date.new(2017, 8, 1)
3.times do
  SwimMeet.create(
    name: Faker::Friends.location,
    date: Faker::Date.between(from, from + 4.months)
  )
end

events = SwimEvent.all
meets = SwimMeet.all

20.times do
  EventHeat.create(
    swim_meet: meets.sample,
    swim_event: events.sample,
    heat_number: Faker::Number.between(1, 8)
  )
end

30.times do
  SwimmerDetail.create(
    name: Faker::Name.name,
    user: users.sample,
    date_of_birth: Faker::Date.birthday(13,18),
    gender: genders.sample
  )
end

swimmers = SwimmerDetail.all
heats = EventHeat.all

100.times do
  SwimTime.create(
    event_heat: heats.sample,
    swimmer_detail: swimmers.sample,
    time_in_seconds: Faker::Number.decimal(2, 2)
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
puts "#{SwimMeet.count} meets created"
puts "#{SwimEvent.count} events created"
puts "#{EventHeat.count} heats created"
puts "#{SwimmerDetail.count} swimmers created"
puts "#{SwimTime.count} times created"
