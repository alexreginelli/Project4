class CocktailsController < ApplicationController
  before_action :require_manager, only: [:new, :create, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.includes(:ingredients)
    if params[:search].present?
      @cocktails = @cocktails.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:ingredient].present?
      @cocktails = @cocktails.joins(:ingredients).where("ingredients.name ILIKE ?", "%#{params[:ingredient]}%").distinct
    end
  end

  def new
    @cocktail = Cocktail.new
    2.times {@cocktail.cocktail_ingredients.build} #2 ingredients is the minimum amount of ingredients for a cocktail
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path, notice: "Cocktail created."
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail), notice: "Cocktail updated."
    else
      @ingredients = Ingredient.all
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path, notice: "Cocktail destroyed."
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :glass, :method, :ice, :garnish, cocktail_ingredients_attributes: [:id, :ingredient_id, :quantity, :_destroy])
  end

  def require_manager
    unless current_user.role.downcase == "manager"
      redirect_to dashboard_path, alert: "Access denied."
    end
  end
end
