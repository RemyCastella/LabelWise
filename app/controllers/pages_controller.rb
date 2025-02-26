class PagesController < ApplicationController
  def dashboard
    @portions = Portion.all
    # @portion = Portion.first
    # @user = current_user
    # @scan = current_user.scans.where(food: @food)
    @total_nutrition = { protein: 0, fat: 0, carbohydrates: 0 }
    @total_cal = 0
    @portions.each do |portion|
      @food = Food.find(portion.food_id)
      @total_nutrition[:protein] += @food.protein * portion.portion_size
      @total_nutrition[:fat] += @food.fat * portion.portion_size
      @total_nutrition[:carbohydrates] += @food.carbohydrates * portion.portion_size
      @total_cal += @food.calories * portion.portion_size
    end
  end
end
