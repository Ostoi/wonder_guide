class CitytoursController < ApplicationController
  def index
    @citytours = Citytour.all.order("created_at DESC")
    @sights = Sight.all
    # @a_sight = Sight.last
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
        # image_url: "https://images.unsplash.com/photo-1644815410301-71ab7334670e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
        image_url: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663085811/development/geolocation_pin_awfnba.png"
      }
    end
  end
  # def list
  #   @citytours = Citytour.all
  # end

  def new
    @citytour = Citytour.new
  end

  def create
    @citytour = Citytour.new(citytour_params)
    @citytour.guide = current_user

    @citytour.sights = Sight.where(id: params[:citytour][:sight_ids])

    if @citytour.save
      # redirect_to index_path_url
      redirect_to citytour_path(@citytour)
    else
      render :new
    end
  end

  def show
    @citytour = Citytour.find(params[:id])
      @sightmarkers = @citytour.sights.map do |sight|
        sight_url = sight.photo.attached? ? helpers.cl_image_path(sight.photo.key) : Sight::DEFAULT_IMG_URL
        {
          lat: sight.latitude,
          lng: sight.longitude,
          image_url: sight_url
        }
      end
    @citytours = Citytour.all
  end

  def edit
    @citytour = Citytour.find(params[:id])
  end

  def destroy
    Citytour.destroy(params[:id])
    redirect_to :controller => 'citytours', :action => 'index'
  end # melchior was here

  private

  def citytour_params
    params.require(:citytour).permit(:name, :overview, :price, sight_ids: [])
  end
end
