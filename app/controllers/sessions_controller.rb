class SessionsController < ApplicationController
  def new
  end

   def create
    if params[:pin].present? && params[:email].blank?
      #pin login
      user = User.find { |u| u.authenticate_pin(params[:pin]) }

      if user
        session[:user_id] = user.id
        session[:login_method] = "pin"
        redirect_to dashboard_path, notice: "PIN login."
      else
        flash.now[:alert] = "Invalid PIN."
        render :new, status: :unprocessable_entity
      end

    else
      #email and password login
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        session[:login_method] = "email"
        redirect_to dashboard_path, notice: "Logged in successfully."
      else
        flash.now[:alert] = "Invalid email or password."
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