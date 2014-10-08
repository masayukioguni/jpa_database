# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weight_category do
    sequence(:name) { |n| "weight_name_#{n}" }
    min 1.5
    max 1.5
  end
end
