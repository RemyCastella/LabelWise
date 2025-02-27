class ScansController < ApplicationController

  def index
    @scans = Scan.where(user: current_user).order(updated_at: :desc)
    @user = current_user
  end

  def show
    @scan = Scan.find(params[:id])
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    if @scan.save
      redirect_to @scan
    else
      redirect_to root_path
    end
  end

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
