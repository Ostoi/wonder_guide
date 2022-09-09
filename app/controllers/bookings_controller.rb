class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.citytour = Citytour.find(params[:citytour_id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new  # Add this line
  end

  def destroy
    Booking.destroy(params[:id])
    # redirect_to citytour_sights_path, status: :see_other
  end # melchior was here


end
