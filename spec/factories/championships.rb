# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :championship do
    name "MyString"
    start_at "2014-10-04"
    end_at "2014-10-04"
    place "MyString"
    is_breakable_japanese_record false
  end
end
