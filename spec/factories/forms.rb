FactoryGirl.define do
  factory :form do
    description Faker::Hipster.words(2)
    url Faker::Internet.url
    active true
    created_by Faker::Name.name
  end
end
