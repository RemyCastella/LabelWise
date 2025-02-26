class ScansController < ApplicationController
  def show
    @scan = Scan.find(params[:id])

    if @scan.food
      redirect_to food_path(@scan.food)
    else
      render :loading
    end
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    if @scan.save
      redirect_to scan_path(@scan)
    else
      redirect_to root_path
    end
  end

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
