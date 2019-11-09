class UsersController < ApplicationController
  before_action :admin

  def index
    @users = User.all
  end

  private


end