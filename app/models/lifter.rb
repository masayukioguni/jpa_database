class Lifter < ActiveRecord::Base
  has_many :Benchpress
  has_many :Powerlifting

  validates :name, presence: true, length: { maximum: 200 }
  validates :name_kana, presence: true, length: { maximum: 400 }
  validates :gender, inclusion: %w(male female), :if => :gender?

  def male?
    gender == "male"
  end
end
