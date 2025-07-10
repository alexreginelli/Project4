# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_10_094515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cocktail_ingredients", force: :cascade do |t|
    t.bigint "cocktail_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_cocktail_ingredients_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_cocktail_ingredients_on_ingredient_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "garnish"
    t.string "ice"
    t.string "glass"
  end

  create_table "develop_cocktail_ingredients", force: :cascade do |t|
    t.bigint "develop_cocktail_id", null: false
    t.bigint "ingredient_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["develop_cocktail_id"], name: "index_develop_cocktail_ingredients_on_develop_cocktail_id"
    t.index ["ingredient_id"], name: "index_develop_cocktail_ingredients_on_ingredient_id"
  end

  create_table "develop_cocktails", force: :cascade do |t|
    t.string "name"
    t.string "method"
    t.string "garnish"
    t.string "ice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "glass"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "alcohol_percentage"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "surname"
    t.string "password_digest"
    t.string "pin"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pin_digest"
  end

  add_foreign_key "cocktail_ingredients", "cocktails"
  add_foreign_key "cocktail_ingredients", "ingredients"
  add_foreign_key "develop_cocktail_ingredients", "develop_cocktails"
  add_foreign_key "develop_cocktail_ingredients", "ingredients"
end
