class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :new, :create, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_path, notice: "User created successfully."
    else
      render :new, status: :unprocessable_entity, alert: "Error."
    end
  end

  def index
    @users = User.all
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "User updated."
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User removed."
  end

  private

  def user_params
    current_user&.role == "admin"
      params.require(:user).permit(:name, :surname, :email, :password, :pin, :role)
  end

  def require_admin
    unless current_user&.role == "admin"
      redirect_to dashboard_path, alert: "Access denied."
    end
  end
end
