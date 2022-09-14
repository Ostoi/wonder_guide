class SightsController < ApplicationController


  def index
    @citytours = Citytour.all
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
        # image_url: "https://tinyurl.com/6tfnjd2w"
        image_url: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663085811/development/geolocation_pin_awfnba.png"
      }
    end

  end

  def new
    @sight = Sight.new
  end

  def show

    @sight = Sight.find(params[:id])
    @citytours = Citytour.all
    @sightmarkers = [{
      lat: @sight.latitude,
      lng: @sight.longitude,
      #image_url: "https://tinyurl.com/6tfnjd2w"
      image_url: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663085811/development/geolocation_pin_awfnba.png"
    }]

  end

  def edit
    @sight = Sight.find(params[:id])
  end

  def update
    return redirect_to root_path unless session[:id]

    @sight = Sight.find(params[:id])
    if @sight.update(update_params)
      redirect_to sights_path
    else
      flash[:error] = "Could not update sight."
      # flash[:errors] = @user.errors.full_messages
      redirect_to "/sights/#{@sight.id}/edit"
    end
  end








  def create
    @sight = Sight.new(sight_params)
    @sight.guide_id = current_user.id
    if @sight.save
      # redirect_to index_path_url
      redirect_to :controller => 'sights', :action => 'index', notice: 'successfully added.'
    else
      render :new
    end
  end

  def destroy
  # THIS IS NOT WORKING
  #@sight.destroy(params[:id])

  # THIS IS WORKING
  Sight.destroy(params[:id])
    redirect_to sights_path
  end

  private

  def sight_params
    params.require(:sight).permit(:name, :city, :address, :photo)
  end
end
