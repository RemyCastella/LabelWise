class ScansController < ApplicationController
  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    @scan.save
    debugger
  end

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
