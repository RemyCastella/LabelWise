class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @user = current_user
    @scan = current_user.scans.find_by(food: @food)
    @nutrition = {
      protein: @food.protein,
      carbohydrates: @food.carbohydrates,
      fat: @food.fat
    }
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
