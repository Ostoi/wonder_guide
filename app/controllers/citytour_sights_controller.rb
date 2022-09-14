class CitytourSightsController < ApplicationController
  def create
    @citytour = Citytour.find(params[:citytour_id])
    @sight = Sight.find(params[:sight])
    @citytour_sight = CitytourSight.new(citytour: @citytour, sight: @sight)
    if @citytour_sight.save
      redirect_to :controller => 'citytours', :action => 'index'
    else
      render :new
    end
  end

  def destroy
    CitytourSight.destroy(params[:id])
    redirect_to citytour_sights_path, status: :see_other
  end # melchior was here



  # def destroy
  #   @citytour_sight = CitytourSight.find(params[:id])
  #   @citytour_sight.destroy
  #   redirect_to citytour_sights_path, status: :see_other
  # end
end
