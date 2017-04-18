FactoryGirl.define do
  factory :swim_time do
    event_heats
    swimmer_details 
    time_in_seconds Faker::Number.decimal(2, 2)
  end
end
