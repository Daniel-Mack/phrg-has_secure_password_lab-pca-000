# frozen_string_literal: true

class UsersController < ApplicationController

  def welcome
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
    else
      user = User.new(user_params)
      user.save
      session[:user_id] = user.id
      redirect_to login_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
