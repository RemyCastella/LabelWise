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

  def favorites
    @favorited_food = current_user.all_favorites.map(&:favoritable)
  end

  def favorite
    @scan = Scan.find(params[:id])
    current_user.favorite(@scan.food) unless current_user.favorited?(@scan.food)
  end

  def unfavorite
    @scan = Scan.find(params[:id])
    current_user.unfavorite(@scan.food)
  end
end
