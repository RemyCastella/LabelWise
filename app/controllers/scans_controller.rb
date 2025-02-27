class ScansController < ApplicationController
  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    if @scan.save
      raise
      redirect_to food_path(@scan.food)
    else
      redirect_to root_path
    end
  end

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
