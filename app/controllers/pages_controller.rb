class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def landing
  end

  def dashboard
    @tab = params[:tab]
    @user = current_user
    @portions = Portion.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day, user: @user)
    if @tab == "yesterday"
      @portions = Portion.where(created_at: Date.yesterday.beginning_of_day..Date.yesterday.end_of_day, user: @user)
    elsif @tab == "this_week"
      @portions = Portion.where(created_at: Date.today.beginning_of_week..Date.today.end_of_day, user: @user)
    end
    @total_nutrition = { protein: 0, fat: 0, carbohydrates: 0, calories: @user.calories }
    @total_cal = 0
    @portions.each do |portion|
      @food = Food.find(portion.food_id)
      @total_nutrition[:protein] += (@food.protein * portion.portion_size * 4).round(1)
      @total_nutrition[:fat] += (@food.fat * portion.portion_size * 9).round(1)
      @total_nutrition[:carbohydrates] += (@food.carbohydrates * portion.portion_size * 4).round(1)
      @total_cal += (@food.calories * portion.portion_size).round(1)
      @total_nutrition[:calories] -= @total_cal
      @total_nutrition[:calories] = 0 if (@total_nutrition[:calories]).negative?
    end
    return unless @tab == "this_week"

    @week_days = (Date.today.beginning_of_week..Date.today.end_of_week).to_a
    @daily_nutrition = {
      protein: [],
      fat: [],
      carbohydrates: [],
      calories: []
    }

    @week_days.each do |day|
      daily_data = @portions.where(created_at: day.beginning_of_day..day.end_of_day)
      protein_total = daily_data.sum { |portion| portion.food.protein * portion.portion_size * 4 }
      fat_total = daily_data.sum { |portion| portion.food.fat * portion.portion_size * 9}
      carbs_total = daily_data.sum { |portion| portion.food.carbohydrates * portion.portion_size * 4 }
      calories_total = daily_data.sum { |portion| portion.food.calories * portion.portion_size}

      @daily_nutrition[:protein] << [day.strftime("%b %d"), protein_total.round(1)]
      @daily_nutrition[:fat] << [day.strftime("%b %d"), fat_total.round(1)]
      @daily_nutrition[:carbohydrates] << [day.strftime("%b %d"), carbs_total.round(1)]
      @daily_nutrition[:calories] << [day.strftime("%b %d"), calories_total.round(1)]
    end
  end
end
