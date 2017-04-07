FactoryGirl.define do
  factory :swim_form do
    description Faker::Hipster.words(2)
    url Faker::Internet.url
    active true
    user 
  end
end
