# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_21_003726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.bigint "menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "order_id"
    t.bigint "menu_item_id"
    t.string "menu_item_name"
    t.decimal "menu_item_price"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.datetime "delivered_at"
    t.bigint "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
  end

end
