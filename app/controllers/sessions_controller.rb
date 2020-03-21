class SessionsController < ApplicationController
  skip_before_action :authenticated_user!

  layout 'session'

  def new
    if current_user
      flash[:notice] = 'You have already login.'
      redirect_to root_url
    else
      render :new
    end
  end

  def create
    user = User.find_by_email(params.dig(:sessions, :email))
    if user && user.authenticate(params.dig(:sessions, :password))
      session[:user_id] = user.id
      flash[:notice] = 'User successfully logged in!'
      redirect_to root_url
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'User successfully logged out!'
    redirect_to root_url
  end
end
