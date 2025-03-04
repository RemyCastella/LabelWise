class PagesController < ApplicationController
  def dashboard
    @tab = params[:tab]
    @user = current_user
    @portions = Portion.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day, user: @user)
    if @tab == "yesterday"
      @portions = Portion.where(created_at: Date.yesterday.beginning_of_day..Date.yesterday.end_of_day, user: @user)
    end
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
