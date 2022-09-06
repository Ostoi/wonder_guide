class UsersController < ApplicationController
  def show
    unless current_user
      redirect_to root_path
    end
    @bookings = current_user.bookings
    @citytours = current_user.citytours
  end
end
