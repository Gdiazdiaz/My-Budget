class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def after_sign_in_path_for(resource)
    user_groups_path(resource)
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
