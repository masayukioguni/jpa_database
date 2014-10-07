# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :powerlifting do
    lifter
    championship
    class_category
    weight_category
    weight 1.5
    squat_first 1.5
    squat_second 1.5
    squat_third 1.5
    benchpress_first 1.5
    benchpress_second 1.5
    benchpress_third 1.5
    deadlift_first 1.5
    deadlift_second 1.5
    deadlift_third 1.5
    result 1.5
    use_gear false
  end
end
