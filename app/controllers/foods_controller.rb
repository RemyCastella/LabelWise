class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @user = current_user
    @scan = current_user.scans.where(food: @food)
  end

  def favorite
    @food = Food.find(params[:id])
    current_user.favorite(@food) unless current_user.favorited?(@food)
    redirect_to food_path(@food)
  end

  def unfavorite
    @food = Food.find(params[:id])
    current_user.unfavorite(@food)
    redirect_to food_path(@food)
  end
end
