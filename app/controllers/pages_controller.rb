class PagesController < ApplicationController
  def splash
    return unless user_signed_in?

    redirect_to user_groups_path(current_user)
  end
end
