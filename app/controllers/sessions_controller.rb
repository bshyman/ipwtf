class SessionsController < ApplicationController

  def login
    @user = User.find_by_email(params[:email])
    respond_to do |format|
      format.html do
        if @user.password === params[:password]
          session[:user_id] = @user.id
          render json: {success: @user.id}
        else
          redirect_to root_path
        end
      end
      format.json do
        if @user.nil?
          render json: {error: 'No user found with that email'}
        elsif @user.password == params[:password]
          reset_session
          session[:user_id] = @user.id
          render json: {success: @user.id}
        elsif @user.password == User::OMNIAUTH_PASSWORD
          render json: {error: 'You logged in with Google. Do that again for now.'}
        else
          render json: {error: 'Incorrect password'}
        end
      end
    end
  end

  def google_login
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth['provider'], uid: auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # check_for_provider_updates
    user.update!(avatar: auth['info']['image']) unless user.avatar.present?
    reset_session
    session[:user_id] = user.id
    ExternalIPService.new.refresh_all_on_login
    redirect_to dashboard_user_path(user.id), notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
