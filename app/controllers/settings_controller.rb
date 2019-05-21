class SettingsController < ApplicationController
before_action :grab_or_make, only: [:edit, :update]
  def edit
  end

  def update
    byebug
    @settings.assign_attributes(settings_params)
    if params[:unsubscribed] == 'on'
      @settings.update(unsubscribed: true)
    else
      @settings.update(unsubscribed: false)
    end
    respond_to do |format|
      format.html do
        redirect_to interfaces_path, notice: 'Saved changes.'
      end
      format.json do
      end
    end
  end

  private

  def grab_or_make
    @settings = Settings.find_or_create_by(user_id: settings_params[:user_id])
  end

  def settings_params
    params.permit(:unsubscribed, :user_id)
  end

end
