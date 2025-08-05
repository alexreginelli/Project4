class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
  end

  private
  def require_login
    unless current_user
      redirect_to login_path, alert: "Need to log in."
    end
  end

  def current_user #show user security level
    unless @current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    @current_user
  end
end
