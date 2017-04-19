FactoryGirl.define do
  factory :event_heat do
    swim_meet
    swim_event
    heat_number Faker::Number.between(1, 8)
  end
end
