# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_username(params[:session][:username])
    if user&.authenticate(params[:session][:password])
      flash[:notice] = 'You logged in successfully'
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = 'There is something wrong with your login details'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:session] = 'Loged out'
    redirect_to root_path
  end
end
