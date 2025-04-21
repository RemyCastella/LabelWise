class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :first_name,
        :last_name,
        :gender,
        :age,
        :vegetarian,
        :vegan,
        :keto,
        :high_protein,
        :pork,
        :beef,
        :gluten,
        :lactose,
        :low_sodium,
        :low_fat,
        :low_carbs
      ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :first_name,
      :last_name,
      :gender,
      :age,
      :vegetarian,
      :vegan,
      :keto,
      :high_protein,
      :pork,
      :beef,
      :gluten,
      :lactose,
      :low_sodium,
      :low_fat,
      :low_carbs
      ])
  end
end
