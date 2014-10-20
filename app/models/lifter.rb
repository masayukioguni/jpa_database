class Lifter < ActiveRecord::Base
  after_initialize :default_value, if: :new_record?

  has_many :Benchpress
  has_many :Powerlifting

  validates :name, presence: true, length: { maximum: 200 }
  validates :name_kana, presence: true, length: { maximum: 400 }
  validates :gender, inclusion: %w(male female), if: :gender?

  def male?
    gender == 'male'
  end

  def bp_count
    Benchpress.where('lifter_id = ?', id).count
  end

  def pl_count
    Powerlifting.where('lifter_id = ?', id).count
  end

  def self.default_all
    Lifter.select('*',
                  'championships.name AS championship_name',
                  'weight_categories.name AS weight_category_name',
                  'class_categories.name AS class_category_name',
                  'lifters.name AS lifter_name')
    .includes(:championship, :lifter,
              :weight_category, :class_category)
  end

  def benchpress_record(use_gear)
    Benchpress.select(:id,
                      'championships.id AS championship_id',
                      'championships.name AS championship_name',
                      'weight_categories.name AS weight_category_name',
                      'class_categories.name AS class_category_name',
                      :weight,
                      :first,
                      :second,
                      :third,
                      :result,
                      :formula,
                      :use_gear)
    .joins(:championship, :lifter,
           :weight_category, :class_category)
    .where('lifter_id = ? AND use_gear = ?', id, use_gear)
    .order('championships.start_at desc')
  end

  private

  def default_value
    self.name_kana ||= 'defalut_value'
    self.gender ||= 'male'
  end
end
