class ScansController < ApplicationController

  def index
    @scans = Scan.where(user: current_user).order(updated_at: :desc)
    @user = current_user
  end

  def show
    @portion = Portion.new
    @scan = Scan.find(params[:id])
    return unless @scan.lat && @scan.lng
    @markers = [{
        lat: @scan.lat,
        lng: @scan.lng
      }].to_json
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.user = current_user
    if @scan.save
      redirect_to @scan
    else
      redirect_to root_path, notice: "scan failed"
    end
  end

  def favorites
    p current_user.all_favorites.map(&:favoritable)

    @favorited_scans = current_user.all_favorites.map(&:favoritable)
  end

  def favorite
    @scan = Scan.find(params[:id])
    already_favorited = current_user.favorited?(@scan)
    if already_favorited
      current_user.unfavorite(@scan)
    else
      current_user.favorite(@scan)
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "star_#{@scan.id}",
          partial: "scans/star",
          locals: { scan: @scan, favorite: !already_favorited }
        )
      end
    end
  end

  # def unfavorite
  #   @scan = Scan.find(params[:id])
  #   current_user.unfavorite(@scan)
  #   respond_to do |format|
  #     format.turbo_stream do
  #       render turbo_stream: turbo_stream.replace(
  #         "star_#{@scan.id}",
  #         partial: "scans/star",
  #         locals: { scan: @scan, favorite: false}
  #       )
  #     end
  #   end
  # end

  private

  def scan_params
    params.require(:scan).permit(:photo)
  end
end
