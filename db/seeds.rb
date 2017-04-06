require 'faker'

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6, 8)
  )
end

3.times do
  Form.create!(
    description: Faker::Superhero.name,
    url: Faker::Internet.url,
    active: true,
    created_by: Faker::Name.name
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
puts "#{Form.count} forms created"
