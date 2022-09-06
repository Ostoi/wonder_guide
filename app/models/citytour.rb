class Citytour < ApplicationRecord
  belongs_to :guide, foreign_key: 'user_id', class_name: 'User'
end
