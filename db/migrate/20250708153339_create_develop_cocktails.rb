class CreateDevelopCocktails < ActiveRecord::Migration[8.0]
  def change
    create_table :develop_cocktails do |t|
      t.string :name
      t.string :method
      t.string :garnish
      t.string :ice

      t.timestamps
    end
  end
end
