class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = current_user
  end
  def update
    @user = current_user
    if params[:user][:common_allergens].present?
      params[:user][:common_allergens] = params[:user][:common_allergens].reject(&:blank?).join(", ")
    end
    if @user.update(user_params)
      flash[:notice] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash[:alert] = "Error updating profile. Please try again."
      render :profile, status: :unprocessable_entity
    end
  end
  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :calories, :protein, :carbohydrates, :fat, :sodium,
      :vegetarian, :vegan, :keto, :pork, :beef, :gluten, :lactose,
      :high_protein, :low_sodium, :low_fat, :low_carbs,
      :common_allergens,
      :other_ingredients
    )
  end
end
