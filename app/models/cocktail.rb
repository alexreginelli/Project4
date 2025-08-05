class Cocktail < ApplicationRecord
    has_many :cocktail_ingredients, dependent: :destroy 
    has_many :ingredients, through: :cocktail_ingredients
    accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true
    validates :name, presence: true
    validate :validate_two_ingredient

    def validate_two_ingredient
    if cocktail_ingredients.size < 2
      errors.add(:base, "Cocktail must have at least two ingredients.")
    end
  end
end
