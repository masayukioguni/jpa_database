class Lifter < ActiveRecord::Base
  has_many :Benchpress
  has_many :Powerlifting

  def male?
    gender == "male"
  end
end
