class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def update
    @user = current_user
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
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation,
      :vegetarian, :vegan, :keto, :pork, :beef, :gluten, :lactose)
    # Removed :calories and :protein since they are not in the database
  end

end
