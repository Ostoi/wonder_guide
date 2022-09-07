class DashboardController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @citytours = current_user.citytours

    # @customer_bookings = current_user.bookings
    # @messages = ?
  end
end
