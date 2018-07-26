# frozen_string_literal: true

class SessionsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id if @user.authenticate(params[:user][:password])
    if session[:user_id]
      redirect_to new_user_path
    else redirect_to login_path
    end
  end
end
