class DevelopCocktailsController < ApplicationController
  def new
    @develop_cocktail = DevelopCocktail.new
    2.times {@develop_cocktail.develop_cocktail_ingredients.build} #minimum amount of ingredients for a cocktail
    @ingredients = Ingredient.all
  end

  def create
    @develop_cocktail = DevelopCocktail.new(develop_cocktail_params)
    if @develop_cocktail.save
      redirect_to develop_cocktails_path, notice: "Cocktail in development."
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def index
    @develop_cocktails = DevelopCocktail.includes(:ingredients)
    if params[:search].present?
      @develop_cocktails = @develop_cocktails.where("name ILIKE ?", "%#{params[:search]}%")
    end
    if params[:ingredient].present?
      @develop_cocktails = @develop_cocktails.joins(:ingredients).where("ingredients.name ILIKE ?", "%#{params[:ingredient]}%").distinct
    end
  end

  def edit
    @develop_cocktail = DevelopCocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @develop_cocktail = DevelopCocktail.find(params[:id])
    if @develop_cocktail.update(develop_cocktail_params)
      redirect_to develop_cocktails_path, notice: "Cocktail updated."
    else
      @ingredients = Ingredient.all
      render :edit
    end
  end

  def destroy
    @develop_cocktail = DevelopCocktail.find(params[:id])
    @develop_cocktail.destroy
    redirect_to develop_cocktails_path, notice: "Cocktail destroyed."
  end

  def show
    @develop_cocktail = DevelopCocktail.find(params[:id])
  end

  private
  def develop_cocktail_params
    params.require(:develop_cocktail).permit(:name, :glass, :method, :garnish, develop_cocktail_ingredients_attributes: [:id, :ingredient_id, :quantity, :_destroy])
  end
end
