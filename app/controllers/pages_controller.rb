class PagesController < ApplicationController
  def dashboard
    @user = current_user
    @portions = Portion.all
    @total_nutrition = { protein: 0, fat: 0, carbohydrates: 0 }
    @total_cal = 0
    @portions.each do |portion|
      next unless portion.created_at.today? && portion.user_id == @user.id

      @food = Food.find(portion.food_id)
      @total_nutrition[:protein] += @food.protein * portion.portion_size
      @total_nutrition[:fat] += @food.fat * portion.portion_size
      @total_nutrition[:carbohydrates] += @food.carbohydrates * portion.portion_size
      @total_cal += @food.calories * portion.portion_size
    end
  end
end
