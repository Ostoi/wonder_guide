class CitytourSitesController < ApplicationController
  def create
    @citytour = Citytour.new(citytourt_params)
    @citytour.user = current_user
    if @citytour.save
      # redirect_to index_path_url
      redirect_to :controller => 'citytours', :action => 'index'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def citytour_params
    params.require(:citytour).permit(:name, :overview, :price)
  end
end
