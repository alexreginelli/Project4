class QuantityDecIngredients < ActiveRecord::Migration[8.0]
  def change
    change_column :cocktail_ingredients, :quantity, :decimal, precision: 5, scale:2
  end
end
