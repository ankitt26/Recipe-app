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

ActiveRecord::Schema[7.0].define(version: 2023_09_14_150245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "measurement_unit"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.text "description", default: "no description provided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "inventory_foods", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "inventory_id", null: false
    t.index ["food_id"], name: "index_inventory_foods_on_food_id"
    t.index ["inventory_id"], name: "index_inventory_foods_on_inventory_id"
  end

  create_table "recipe_foods", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "preparation_time"
    t.string "cooking_time"
    t.string "description"
    t.boolean "public"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "users"
  add_foreign_key "inventory_foods", "inventories"
  add_foreign_key "recipe_foods", "foods", on_delete: :cascade
  add_foreign_key "recipe_foods", "recipes", on_delete: :cascade
  add_foreign_key "recipes", "users", on_delete: :cascade
end
