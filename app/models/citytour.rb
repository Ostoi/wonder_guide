class Citytour < ApplicationRecord
  belongs_to :guide, foreign_key: 'guide_id', class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :citytour_sights, dependent: :destroy
  has_many :sights, through: :citytour_sights
end
