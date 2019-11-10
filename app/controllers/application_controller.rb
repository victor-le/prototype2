class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :phone_number])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :phone_number])
    end

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end

end