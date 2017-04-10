FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.unique.safe_email
    password "password"
    password_confirmation "password"
    provider "Google"
    uid SecureRandom.uuid
    role "standard"
  end
end
