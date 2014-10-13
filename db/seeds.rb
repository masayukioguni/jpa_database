# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
ClassCategory.create(:name => '一般')
ClassCategory.create(:name => 'ジュニア')

WeightCategory.create(:name => '59kg',:min => 40.0,:max => 59.0)
WeightCategory.create(:name => '66kg',:min => 59.1,:max => 66.0)

Championship.create(:name => '全日本',:start_at => "2000/01/01",:end_at => "2000/01/02",:is_breakable_japanese_record => true)
Championship.create(:name => '東京',:start_at => "2000/02/01",:end_at => "2000/02/01",:is_breakable_japanese_record => false)

Lifter.create(:name => '小國 正之',:name_kana => "オグニ マサユキ",:birthday => "1980/01/08",:gender => 'male')
Lifter.create(:name => '福島 友佳子',:name_kana => "フクシマ ユカコ",:birthday => "1980/01/08",:gender => 'female')
Lifter.create(:name => 'a',:name_kana => "a",:birthday => "1980/01/08",:gender => 'female')


Benchpress.create(:lifter_id => 1,:championship_id=>1,:class_category_id=>1,:weight_category_id=>2,:weight=>65.9,:first=>100.5,:second=>105.0,:third=>-110.0,:use_gear =>false)
Benchpress.create(:lifter_id => 1,:championship_id=>2,:class_category_id=>1,:weight_category_id=>2,:weight=>65.9,:first=>100.5,:second=>105.0,:third=> 110.0,:use_gear =>true)
Benchpress.create(:lifter_id => 2,:championship_id=>1,:class_category_id=>1,:weight_category_id=>2,:weight=>65.9,:first=>100.5,:second=>105.0,:third=>-110.0,:use_gear =>false)
Benchpress.create(:lifter_id => 2,:championship_id=>2,:class_category_id=>1,:weight_category_id=>2,:weight=>65.9,:first=>100.5,:second=>105.0,:third=> 110.0,:use_gear =>true)
Benchpress.create(:lifter_id => 3,:championship_id=>1,:class_category_id=>1,:weight_category_id=>2,:weight=>65.9,:first=>100.5,:second=>105.0,:third=> 110.0,:use_gear =>true)