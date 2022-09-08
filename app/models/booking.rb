class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :citytour
  enum :status, { pending: 0, accepted: 1, denied: 2 }
end
