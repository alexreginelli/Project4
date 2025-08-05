class Ingredient < ApplicationRecord
    has_many :cocktail_ingredients
    has_many :cocktail, through: :cocktail_ingredients
    validates :name, presence: true
    validates :category, presence: true
end
