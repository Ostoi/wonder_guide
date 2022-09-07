class SightsController < ApplicationController

  def index
    @sights = Sight.all
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

  private

  def sight_params
    params.require(:sight).permit(:name, :city, :address, :photo)
  end
end
