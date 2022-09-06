class SightsController < ApplicationController

  def index
    @sights = sight.all
  end

  def new
    @sight = sight.new
  end

  def show
    @sight = Sight.find(params[:id])
  end

  def edit
    @sight = Sight.find(params[:id])
  end

  def create
    @sight = sight.new(sight_params)
    @sight.user = current_user
    if @sight.save
      # redirect_to index_path_url
      redirect_to :controller => 'sight', :action => 'index'
    else
      render :new
    end
  end

  private

  def sight_params
    params.require(:sight).permit(:name, :overview, :price)
  end
end
