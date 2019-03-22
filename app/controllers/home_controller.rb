class HomeController < ApplicationController
  layout '_base'

  def landing
    redirect_to dashboard_user_path(current_user.id) if user_signed_in?
  end
end
