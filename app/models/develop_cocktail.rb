class DevelopCocktail < ApplicationRecord
    has_many :develop_cocktail_ingredients, dependent: :destroy
    has_many :ingredients, through: :develop_cocktail_ingredients
    accepts_nested_attributes_for :develop_cocktail_ingredients, allow_destroy: true
end
