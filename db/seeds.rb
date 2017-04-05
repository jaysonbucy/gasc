require 'faker'

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6, 8)
  )
end

admin = User.create!(
  first_name: "Jayson",
  last_name: "Bucy",
  email: "jayson@bucy.me",
  password: "testing01",
  role: "admin"
)

puts "Seed finshed"
puts "#{User.count} users created"
