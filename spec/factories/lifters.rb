# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lifter do
    sequence(:name) { |n| "lifter_name_#{n}" }
    sequence(:name_kana) { |n| "lifter_kana_#{n}" }
    birthday DateTime.now
    gender "male"
  end
end
