require "test_helper"

class CocktailTest < ActiveSupport::TestCase
  test "valid with name and two ingredients" do
  i1 = Ingredient.create!(name: "Assolut", category: "Vodka", description: "Clear alcohol obtained fermenting potato", alcohol_percentage: 40.0)
  i2 = Ingredient.create!(name: "Orange", category: "Juice", description: "Juice obtained squeezing oranges", alcohol_percentage: 0.0)

  cocktail = Cocktail.new(name: "Screwdriver")
  cocktail.cocktail_ingredients.build(ingredient: i1, quantity: 50)
  cocktail.cocktail_ingredients.build(ingredient: i2, quantity: 100)

  assert cocktail.valid?
  end

  test "not valid with only one ingredient" do
  i = Ingredient.create!(name: "Amalfy", category: "Gin", description: "Clear alcohol obtained with botanical and citrus from the Amalfi coast", alcohol_percentage: 40)
  
  cocktail = Cocktail.new(name: "Gin shot")
  cocktail.cocktail_ingredients.build(ingredient: i, quantity: 50)

  assert_not cocktail.valid?
end
end
