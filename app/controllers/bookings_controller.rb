class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @citytour = Citytour.find(params[:citytour_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.citytour = Citytour.find(params[:citytour_id])
    @booking.status = 0
    @booking.save
    redirect_to dashboard_path, notice: "You have booked #{@booking.citytour.name}"
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
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.accepted!
      redirect_to request.referer, notice: "Booking accepted"
    end
  end

  def deny
    @booking = Booking.find(params[:id])
    if @booking.denied!
      redirect_to request.referer, notice: "Booking denied"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
