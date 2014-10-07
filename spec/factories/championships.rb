# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :championship do
    sequence(:name) { |n| "championship_name_#{n}" }
    start_at DateTime.now - 3
    end_at DateTime.now + 3
    sequence(:place) { |n| "championship_place_#{n}" }
    is_breakable_japanese_record false
  end
end
