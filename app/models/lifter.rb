class Lifter < ActiveRecord::Base
  after_initialize :default_value, if: :new_record?

  has_many :Benchpress
  has_many :Powerlifting

  validates :name, presence: true, length: { maximum: 200 }
  validates :name_kana, presence: true, length: { maximum: 400 }
  validates :gender, inclusion: %w(male female), :if => :gender?

  def male?
    gender == "male"
  end
  
  def bp_count
    Benchpress.where("lifter_id = ?" , id).count
  end
  
  def pl_count
    Powerlifting.where("lifter_id = ?" , id).count
  end

  private
  def default_value
    self.name_kana ||= 'defalut_value'
    self.gender ||= 'male'  
  end

end
