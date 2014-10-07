# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :benchpress do
    lifter
    championship
    class_category
    weight_category
    weight 1.5
    first 1.5
    second 1.5
    third 1.5
    result 1.5
    use_gear false
  end
end
