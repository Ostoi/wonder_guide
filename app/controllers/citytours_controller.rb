class CitytoursController < ApplicationController
  def index
    @citytours = Citytour.all
  end

  # def list
  #   @citytours = Citytour.all
  # end

  def new
    @citytour = Citytour.new
  end

  def create
    @citytour = Citytour.new(citytour_params)
    @citytour.user = current_user
    if @citytour.save
      # redirect_to index_path_url
      redirect_to :controller => 'citytours', :action => 'index'
    else
      render :new
    end
  end

  def show
    @citytour = Citytour.find(params[:id])
    @sightmarkers = @citytour.sights.map do |sight|
      sight_url = sight.photo.attached? ? cl_image_url(sight.photo.key) : Sight::DEFAULT_IMG_URL
      {
        lat: sight.latitude,
        lng: sight.longitude,
        image_url: sight_url
      }
    end
  end

  def edit
    @citytour = Citytour.find(params[:id])
  end

  def destroy
    Citytour.destroy(params[:id])
    # redirect missing
  end # melchior was here

  private

  def citytour_params
    params.require(:citytour).permit(:name, :overview, :price)
  end
end
