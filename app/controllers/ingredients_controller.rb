class IngredientsController < ApplicationController
  before_action :require_manager, only: [:new, :create, :index, :edit, :update, :destroy]

  def index
    @categories = Ingredient.distinct.pluck(:category)
    @ingredients = Ingredient.all
  
    if params[:search].present?
      @ingredients = @ingredients.where("name ILIKE ?", "%#{params[:search]}%")
    end
  
    if params[:category].present?
      @ingredients = @ingredients.where(category: params[:category])
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to dashboard_path, notice: "Ingredient added."
    else
      render :new, alert: "Ingredient not added."
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path, notice: "Ingredient updated."
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.cocktail_ingredients.exists?
      redirect_to ingredients_path, alert: "Ingredient used in cocktails."
    else
      @ingredient.destroy
      redirect_to ingredients_path, notice: "Ingredient deleted."
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :category, :description)
  end

  def require_manager
    unless current_user.role.downcase == "manager"
      redirect_to dashboard_path, alert: "Access denied."
    end
  end
end
