class SightsController < ApplicationController

  def index
    @sights = Sight.all
    @a_sight = Sight.last


    if params[:longitude] && params[:latitude]
      @sights = Sight.near([params[:latitude], params[:longitude]], 50)
    end

    if params[:address]
      @sights = Sight.near(params[:address], 50)
    end

    # The `geocoded` scope filters only sights with coordinates
    @markers = @sights.geocoded.map do |sight|
      {
        lat: sight.latitude,
        lng: sight.longitude,
        info_window: render_to_string(partial: "info_window", locals: {sight: sight}),
        image_url: "https://images.unsplash.com/photo-1644815410301-71ab7334670e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
      }
    end

  end

  def new
    @sight = Sight.new
  end

  def show
    @sight = Sight.find(params[:id])
  end

  def edit
    @sight = Sight.find(params[:id])
  end

  def create
    @sight = Sight.new(sight_params)
    @sight.user_id = current_user.id
    if @sight.save
      # redirect_to index_path_url
      redirect_to :controller => 'sights', :action => 'index'
    else
      render :new
    end
  end

  def destroy
    @sight.destroy(params[:id])
    redirect_to :controller => 'sight', :action => 'index'
  end

  private

  def sight_params
    params.require(:sight).permit(:name, :city, :address, :photo)
  end
end
