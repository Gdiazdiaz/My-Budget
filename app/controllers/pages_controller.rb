class PagesController < ApplicationController
  def splash
    if user_signed_in? 
      redirect_to user_groups_path(current_user)
    end
  end
end
