class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :sights

  # this is for the booking records (sydel)
  has_many :bookings, dependent: :destroy
  # this is zach's code line 10
  has_many :citytours, foreign_key: "guide_id", class_name: "Citytour"

  has_many :guide_bookings, -> { order(start: :asc) }, :through => :citytours, :source => :bookings

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
              .order(start: :desc)

    # citytours.joins(:bookings).where(bookings: {})
    # Booking.where(guide: self).where("end < ?", DateTime.now).order(start: :asc)
    # citytours.where("end < ?", DateTime.now).order(start: :asc)
  end
  def past_bookings
    citytours.joins(:bookings)
    .where(bookings: {start: (DateTime.new(2022, 1, 1, 16)..DateTime.now)})
    .order(start: :desc)
  end
end
