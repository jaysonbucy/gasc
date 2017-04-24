FactoryGirl.define do
  factory :swim_event do
    name { ['backstroke', 'breaststroke', 'freestyle', 'butterfly'].sample }
    distance_in_yards { [25, 50, 100, 200, 400, 800].sample }
    age_group_start 13
    age_group_end 18
    gender { ['male', 'female'].sample }
  end
end
