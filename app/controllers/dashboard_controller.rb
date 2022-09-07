class DashboardController < ApplicationController
  def dashboard
    @citytours = current_user.citytours
    # @customer_bookings = current_user.bookings
    # @messages = ?
  end
end
