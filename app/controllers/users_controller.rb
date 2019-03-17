class UsersController < ApplicationController
  prepend_view_path(File.join(Rails.root, 'app/views/users/'))
  layout 'application'
  layout 'sidenav'
  def dashboard          
    @body_class = "with-sidebar show-sidebar"

  end
  def index
  end

  def billing
  end

  def plan
  end

  def show
    redirect_to user_profile_path
  end

  def profile
  end

  def support
  end

  def notifications
  end

end
