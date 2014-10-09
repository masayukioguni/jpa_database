class Benchpress < ActiveRecord::Base
  belongs_to :lifter
  belongs_to :championship
  belongs_to :weight_category
  belongs_to :class_category

  include JapaneseRecord

  def formula
    lifter = Lifter.where("id = ?" , lifter_id).first
    if lifter.male?
      Wilksformula.men_formula(weight,result)
    else
      Wilksformula.women_formula(weight,result)
    end
  end
end
