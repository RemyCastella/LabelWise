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

  def favorites
    @favorited_scans = current_user.all_favorites.map(&:favoritable)
  end

  def favorite
    @scan = Scan.find(params[:id])
    current_user.favorite(@scan) unless current_user.favorited?(@scan)
  end

  def unfavorite
    @scan = Scan.find(params[:id])
    current_user.unfavorite(@scan)
  end

  private

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
