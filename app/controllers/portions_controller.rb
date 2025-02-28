class PortionsController < ApplicationController
  def new
    @portion = Portion.new
    @scan = Scan.find(params[:scan_id])
  end

  def create
    @portion = Portion.new(portion_params)
    @portion.user = current_user
    @portion.food = Scan.find(params[:scan_id]).food
    if @portion.save
      redirect_to root_path
    else
      render :new, status: unprocessable_entity
    end
  end

  private

  def portion_params
    params.require(:portion).permit(:portion_size)
  end
end
