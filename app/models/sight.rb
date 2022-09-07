class Sight < ApplicationRecord
  belongs_to :guide, foreign_key: 'user_id', class_name: 'User'
  has_one_attached :photo
end
