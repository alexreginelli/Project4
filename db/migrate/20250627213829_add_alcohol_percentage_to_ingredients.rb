class AddAlcoholPercentageToIngredients < ActiveRecord::Migration[8.0]
  def change
    add_column :ingredients, :alcohol_percentage, :decimal
  end
end
