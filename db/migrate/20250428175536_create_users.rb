class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :password_digest
      t.string :pin
      t.string :role

      t.timestamps
    end
  end
end
