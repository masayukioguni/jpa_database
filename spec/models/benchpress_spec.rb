require 'rails_helper'

RSpec.describe Benchpress, :type => :model do
  describe 'formula' do
    context '男性用' do
      before(:each) do
        @lifter = FactoryGirl.create(:lifter,
                                     :gender => "male")

        @record = FactoryGirl.create(:benchpress,
                                     :lifter_id => @lifter.id,
                                     :weight => 60,
                                     :result => 600)
      end
      it "フォーミュラ計算を取得できる" do
        expect(@record.formula).to eq(511.74)
      end
    end
    context '女性用' do
      before(:each) do
        @lifter = FactoryGirl.create(:lifter, :gender => "female")

        @record = FactoryGirl.create(:benchpress,
                                     :lifter_id => @lifter.id,
                                     :weight => 60,
                                     :result => 600)
      end
      it "フォーミュラ計算を取得できる" do
        expect(@record.formula).to eq(668.94)
      end
    end
  end
  describe 'benchpress_japan_record' do
    context '全日本大会よりも地方大会記録の良い記録の場合' do
      before(:each) do
        @local_championship = FactoryGirl.create(:championship,:is_breakable_japanese_record => false)
        @japan_championship = FactoryGirl.create(:championship,:is_breakable_japanese_record => true)

        @weight_category = FactoryGirl.create(:weight_category)
        @class_category = FactoryGirl.create(:class_category)

        @local_record = FactoryGirl.create(:benchpress,
                                           :weight_category_id => @weight_category.id,
                                           :class_category_id => @class_category.id,
                                           :championship_id => @local_championship.id,
                                           :result => 105,
                                           :use_gear => true)
        @japan_record = FactoryGirl.create(:benchpress,
                                           :weight_category_id => @weight_category.id,
                                           :class_category_id => @class_category.id,
                                           :championship_id => @japan_championship.id,
                                           :result => 100,
                                           :gear => true)
      end
      it "日本記録は全日本の記録からとる" do
        model =  Benchpress.benchpress_japan_record(@weight_category.id,@class_category.id,true)
        expect(model.result).to eq(100)
      end
    end
    context '日本記録を更新できる大会を複数含む場合' do
      before(:each) do
        @local_championship = FactoryGirl.create(:championship,:is_breakable_japanese_record => false)
        @section_championship = FactoryGirl.create(:championship,:is_breakable_japanese_record => true)
        @japan_championship = FactoryGirl.create(:championship,:is_breakable_japanese_record => true)


        @weight_category = FactoryGirl.create(:weight_category)
        @class_category = FactoryGirl.create(:class_category)

        FactoryGirl.create(:benchpress,
                           :weight_category_id => @weight_category.id,
                           :class_category_id => @class_category.id,
                           :championship_id => @local_championship.id,
                           :result => 105,
                           :use_gear => true)
        FactoryGirl.create(:benchpress,
                           :weight_category_id => @weight_category.id,
                           :class_category_id => @class_category.id,
                           :championship_id => @section_championship.id,
                           :result => 150,
                           :use_gear => true)
        FactoryGirl.create(:benchpress,
                           :weight_category_id => @weight_category.id,
                           :class_category_id => @class_category.id,
                           :championship_id => @japan_championship.id,
                           :result => 100,
                           :use_gear => true)
      end
      it "日本記録は日本記録を更新できる大会からとる" do 
        model =  Benchpress.benchpress_japan_record(@weight_category.id,@class_category.id,true)
        expect(model.result).to eq(150)
      end
    end
  end
end
