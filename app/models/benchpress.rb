class Benchpress < ActiveRecord::Base
  belongs_to :lifter
  belongs_to :championship
  belongs_to :weight_category
  belongs_to :class_category

  include JapaneseRecord


end
