class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :citytour
  has_many :reviews, dependent: :destroy
end
