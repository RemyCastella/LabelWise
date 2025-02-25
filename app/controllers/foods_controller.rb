class FoodsController < ApplicationController
  def create
    @scan = Scan.first
    @food = Food.new(@scan.content)
    if @food.save
      raise
      redirect_to food_path(@food)
    elsif
      redirect_to dashboard_path
    end
  end
end
