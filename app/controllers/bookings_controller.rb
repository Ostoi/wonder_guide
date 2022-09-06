class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.citytour = Citytour.find(params[:city_tour_id])
    @booking.save
    redirect_to booking_path(@booking)
  end
end
