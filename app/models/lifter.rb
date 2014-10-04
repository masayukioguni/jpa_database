class Lifter < ActiveRecord::Base
  has_many :Benchpress
  has_many :Powerlifting

  enum gender: [:male ,:female]
end
