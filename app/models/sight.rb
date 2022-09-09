class Sight < ApplicationRecord
  belongs_to :guide, foreign_key: 'user_id', class_name: 'User'
  has_one_attached :photo
  has_many :citytour_sights, dependent: :destroy
  has_many :citytours, through: :citytour_sights
  validates :longitude, presence: true
  validates :latitude, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
