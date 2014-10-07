require 'active_support'
module JapaneseRecord
  extend ActiveSupport::Concern

  module ClassMethods
    def benchpress_japan_record(weight_category_id,class_category_id,use_gear)
      Benchpress.select(:id,'championships.name AS championship_name',
                        'weight_categories.name AS weight_category_name',
                        'class_categories.name AS class_category_name',
                        'lifters.name AS lifter_name',
                        :weight,
                        :result,
                        :use_gear)
      .joins(:championship,:lifter,
             :weight_category,:class_category)
      .where("weight_category_id = ? AND class_category_id = ? AND use_gear = ? AND championships.is_breakable_japanese_record = ?",
             weight_category_id,class_category_id,use_gear,true)
      .order(created_at: :desc).first
    end
  end

  def b

    p "bbbbbbb"
  end

  


end