class ApplicationController < ActionController::Base
  protected

  def after_sign_out_path_for(resource_or_scope)
    dashboard_path # Redirect to /dashboard after logout
  end
end
