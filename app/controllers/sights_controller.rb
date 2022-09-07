class SightsController < ApplicationController

  def index
    @sights = Sight.all
  end
  def list
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
    @sight.user = current_user
    if @sight.save
      # redirect_to index_path_url
      redirect_to :controller => 'sight', :action => 'index'
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
    params.require(:sight).permit(:name, :overview, :price)
  end
end
