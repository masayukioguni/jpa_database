# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_category do
    sequence(:name) { |n| "class_name_#{n}" }
  end
end
