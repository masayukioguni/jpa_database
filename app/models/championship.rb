class Championship < ActiveRecord::Base
  has_many :Benchpress
  has_many :Powerlifting

  validate :name, presence: true
end
