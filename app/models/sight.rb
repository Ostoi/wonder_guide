class Sight < ApplicationRecord
  DEFAULT_IMG_URL = "https://images.unsplash.com/photo-1474831626379-cfcad2ba6309?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80"
  belongs_to :guide, class_name: 'User'
  has_one_attached :photo
  has_many :citytour_sights, dependent: :destroy
  has_many :citytours, through: :citytour_sights
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
