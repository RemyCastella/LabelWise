class ScansController < ApplicationController
  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    if @scan.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
