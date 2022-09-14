class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    respond_to do |format|
      if @review.save
        format.html { redirect_to dashboard_path }
        format.json
      else
        render new
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to booking_path(@review.booking), status: :see_other
    end
  end

  # Below Code from lecture

  # def create
  #   @review = Review.new(review_params)
  #   @review.booking = @booking
  #   @review.save
  #   redirect_to booking_path(@booking)
  # end

  # Above Code from lecture

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:reviewtext)
  end
end
