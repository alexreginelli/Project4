require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  test "valid with all enters" do
    i = Ingredient.new(name: "NameTest", category: "TestCategory", description: "TestDescription", alcohol_percentage: 0)
    assert i.valid?
  end

  test "not valid without name" do
    i = Ingredient.new(category: "TestCategory", description: "TestDescription", alcohol_percentage: 0)
    assert_not i.valid?
  end

  test "not valid without category" do
    i = Ingredient.new(name: "NameTest", description: "TestDescription", alcohol_percentage: 0)
    assert_not i.valid?
  end

  test "valid without description and abv" do
    i = Ingredient.new(name: "NameTest", category: "TestCategory")
    assert i.valid?
  end
  
end
