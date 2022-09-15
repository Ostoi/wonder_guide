class DashboardController < ApplicationController
  def dashboard
    next_5_days = DateTime.now.beginning_of_day..(DateTime.now + 5.days).end_of_day
    if current_user.guide?
      #FOR GUIDE
      @bookings = current_user.guide_bookings.where(status: "pending", start: next_5_days)
      @citytours = current_user.citytours
    else
      # FOR TRAVELLER
      @citytours = Citytour.where(bookings: current_user.bookings.where(status: "accepted", start: next_5_days))
      @bookings = current_user.bookings.where(status: "pending")
    end
  end
end
