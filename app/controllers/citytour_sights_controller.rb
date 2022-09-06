class CitytourSightsController < ApplicationController
  def create

    @citytour_sight = Citytour_sight.new(citytour_sights_params)
    if @citytour_sight.save
      redirect_to :controller => 'citytour_sights', :action => 'index'
    else
      render :new
    end
  end

  def destroy
    @citytour_sight = Citytour_sight.find(params[:id])
    @citytour_sight.destroy
    redirect_to citytour_sights_path, status: :see_other
  end

  private

  def citytour_sights_params
    params.require(:citytour_sights).permit(:citytour_id, :sight_id)
  end
end
