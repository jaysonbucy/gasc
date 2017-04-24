FactoryGirl.define do
  factory :swim_meet do
    name Faker::Friends.location
    date Faker::Date.between(Date.today, 1.year.from_now)
  end
end
