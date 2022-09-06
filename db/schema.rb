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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_133523) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start", precision: nil
    t.datetime "end", precision: nil
    t.float "price"
    t.float "total_price"
    t.integer "quantity"
    t.bigint "user_id", null: false
    t.bigint "citytour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citytour_id"], name: "index_bookings_on_citytour_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "citytour_sights", force: :cascade do |t|
    t.bigint "citytour_id", null: false
    t.bigint "sight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citytour_id"], name: "index_citytour_sights_on_citytour_id"
    t.index ["sight_id"], name: "index_citytour_sights_on_sight_id"
  end

  create_table "citytours", force: :cascade do |t|
    t.string "name"
    t.text "overview"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_citytours_on_user_id"
  end

  create_table "sights", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.text "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_guide"
    t.string "name"
    t.string "nickname"
    t.text "payment_details"
    t.string "country"
    t.boolean "guide"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "citytours"
  add_foreign_key "bookings", "users"
  add_foreign_key "citytour_sights", "citytours"
  add_foreign_key "citytour_sights", "sights"
  add_foreign_key "citytours", "users"
end
