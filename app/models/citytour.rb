class Citytour < ApplicationRecord
  belongs_to :guide, foreign_key: 'guide_id', class_name: 'User'
  has_many :bookings, dependent: :destroy
end
