class CreateDevelopCocktailIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :develop_cocktail_ingredients do |t|
      t.references :develop_cocktail, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
