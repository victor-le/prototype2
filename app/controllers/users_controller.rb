class UsersController < ApplicationController

  
  def index
    @users = User.all
  end

  private

  def must_be_admin
    unless current_user.admin?
      redirect_to app_schedules_path, alert: "You don't have access to this page."
    end
  end
end