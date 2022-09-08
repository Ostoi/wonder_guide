class Review < ApplicationRecord
  belongs_to :booking
  validates :reviewtext, length: {minimum: 10}
end
