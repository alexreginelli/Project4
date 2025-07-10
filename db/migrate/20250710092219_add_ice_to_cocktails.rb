class AddIceToCocktails < ActiveRecord::Migration[8.0]
  def change
    add_column :cocktails, :ice, :string
  end
end
