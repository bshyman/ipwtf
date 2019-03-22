class UsersController < ApplicationController
  prepend_view_path(File.join(Rails.root, 'app/views/users/'))
  layout 'application'
  layout 'sidenav'

  def new
  end

  def create
    user = User.new(user_params)
    if user.save!
      session[:user_id] = user.id
      redirect_to dashboard_user_path, notice: 'User created.'
    else
      redirect_to root_path, error: 'user not created'
    end

  end

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
    redirect_to dashboard_user_path
  end

  def profile
  end

  def support
  end

  def notifications
  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end

end
