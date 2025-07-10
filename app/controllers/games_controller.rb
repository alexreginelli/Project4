class GamesController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
    @ingredient_slots = @cocktail.cocktail_ingredients.size
  end

  def submit
    @cocktail = Cocktail.find(params[:id])
    correct = @cocktail.cocktail_ingredients.map do |ci|
      {
        name: ci.ingredient.name,
        quantity: ci.quantity.to_f
      }
    end
    guesses = params[:guesses].values.map do |g| #user input
      {
        name: g[:ingredient_name],
        quantity: g[:quantity].to_f
      }
    end
    match = correct.all? do |c|
      guesses.any? do |g|
        g[:name] == c[:name] && g[:quantity] - c[:quantity]
      end
    end
    if match
      flash[:notice] = "Correct!"
    else
      flash[:alert] = "Wrong."
    end
    redirect_to play_cocktail_game_path(@cocktail)
  end
end
