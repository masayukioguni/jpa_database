# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weight_category do
    name "MyString"
    min 1.5
    max 1.5
  end
end
