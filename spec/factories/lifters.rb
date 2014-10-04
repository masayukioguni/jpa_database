# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lifter do
    name "MyString"
    name_kana "MyString"
    birthday "2014-10-04"
    gender "MyString"
  end
end
