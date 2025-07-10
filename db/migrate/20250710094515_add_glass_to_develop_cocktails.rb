class AddGlassToDevelopCocktails < ActiveRecord::Migration[8.0]
  def change
    add_column :develop_cocktails, :glass, :string
  end
end
