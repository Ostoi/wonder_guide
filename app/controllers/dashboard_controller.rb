class DashboardController < ApplicationController
  def dashboard
    #FOR GUIDE
    @bookings = current_user.bookings
    @citytours = current_user.citytours
    @guide_bookings = Booking.where(citytour: @citytours)
    # FOR TRAVELLER
    @pending_bookings = current_user.bookings.where(status: "pending")
    @upcoming_citytours = Citytour.where(bookings: current_user.bookings.where(status: "accepted"))
  end
end
