require 'faker'

5.times do
  User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(6, 8)
  )
end

test_account = User.create!(
  firstname: "Tester",
  lastname: "Account",
  email: "tester.account@testing.test",
  password: "password01"
)

admin = User.create!(
  firstname: "Jayson",
  lastname: "Bucy",
  email: "jayson@bucy.me",
  password: "testing01"
)

puts "Seed finshed"
puts "#{User.count} users created"
