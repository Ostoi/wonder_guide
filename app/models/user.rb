class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :bookings
  has_many :citytours, foreign_key: "guide_id", class_name: "Citytour"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_taggable_on :languages

  def make_guide
    self.update_column(:guide, true)
  end

  def upcoming_citytours(day_count)
    # Citytour.joins(:bookings).where(guide: self).where("bookings.start > ?", DateTime.now).order(start: :asc)
    # citytours.joins(:bookings).where("bookings.start > ?", DateTime.now).order(start: :asc)
    next_5_days = DateTime.now.beginning_of_day..(DateTime.now.beginning_of_day + day_count.days)
    citytours.joins(:bookings)
              .where(bookings: {start: next_5_days})
              .order(start: :asc)

    # citytours.joins(:bookings).where(bookings: {})
    # Booking.where(guide: self).where("end < ?", DateTime.now).order(start: :asc)
    # citytours.where("end < ?", DateTime.now).order(start: :asc)
  end
end
