require "test_helper"

class DevelopCocktailTest < ActiveSupport::TestCase
  test "valid with only one ingredient" do
  i = Ingredient.create!(name: "Amalfy", category: "Gin", description: "Clear alcohol obtained with botanical and citrus from the Amalfi coast", alcohol_percentage: 40)
  cocktail = DevelopCocktail.new(name: "Gin shot")
  cocktail.develop_cocktail_ingredients.build(ingredient: i, quantity: 50)
  assert cocktail.valid?
  end
end
