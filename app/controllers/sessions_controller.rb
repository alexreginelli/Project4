class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:pin].present?
      user = User.find_by(pin: params[:pin])
      if user&.authenticate_pin(params[:pin])
        session[:user_id] = user.id
        session[:login_method] = "pin"
        redirect_to dashboard_path, notice: "PIN login."
      else
        flash.now[:alert] = "Credentials not valid."
        render :new, status: :unprocessable_entity
      end
    else
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to dashboard_path, notice: "Logged in successfully."
      else
        flash.now[:alert] = "Invalid inputs."
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:login_method] = nil
    redirect_to login_path, notice: "Logged out successfully."
  end
end