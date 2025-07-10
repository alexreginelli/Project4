class AddGarnishToCocktails < ActiveRecord::Migration[8.0]
  def change
    add_column :cocktails, :garnish, :string
  end
end
