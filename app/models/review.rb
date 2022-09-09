class Review < ApplicationRecord
  belongs_to :booking
  validates :reviewtext, length: {minimum: 10}

  def author
    if isguide
      return booking.citytour.guide
    else
      return booking.user
    end
  end
end
