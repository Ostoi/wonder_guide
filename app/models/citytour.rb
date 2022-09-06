class Citytour < ApplicationRecord
  belongs_to :guide, foreign_key: 'guide_id', class_name: 'User'
end
