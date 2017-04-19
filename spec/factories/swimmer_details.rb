FactoryGirl.define do
  factory :swimmer_detail do
    name Faker::Name.name
    user
    date_of_birth Faker::Date.birthday(13,18)
    gender { ['male', 'female'].sample }
  end
end
