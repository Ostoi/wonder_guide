class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @citytour = Citytour.find(params[:citytour_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.citytour = Citytour.find(params[:citytour_id])
    @booking.save
    redirect_to sights_path, notice: "You have booked #{@booking.citytour.name}"
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

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
