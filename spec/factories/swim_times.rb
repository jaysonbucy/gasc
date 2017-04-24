FactoryGirl.define do
  factory :swim_time do
    event_heat
    swimmer_detail 
    time_in_seconds Faker::Number.decimal(2, 2)
  end
end
