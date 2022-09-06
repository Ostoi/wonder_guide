class CitytourSight < ApplicationRecord
  belongs_to :citytour
  belongs_to :sight
  has_one :guide, through: :citytour
end
