class UsersController < ApplicationController

  
  def index
    @users = User.all
  end

  private


end