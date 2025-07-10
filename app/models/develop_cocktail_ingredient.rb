class DevelopCocktailIngredient < ApplicationRecord
  belongs_to :develop_cocktail
  belongs_to :ingredient
end
