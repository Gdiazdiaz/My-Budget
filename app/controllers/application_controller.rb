class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    user_groups_path(@user.id)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
