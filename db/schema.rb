# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_20_063636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rental_id"
    t.index ["rental_id"], name: "index_chat_rooms_on_rental_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.bigint "renter_id"
    t.bigint "rentee_id"
    t.bigint "techget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.boolean "confirmed"
    t.index ["rentee_id"], name: "index_rentals_on_rentee_id"
    t.index ["renter_id"], name: "index_rentals_on_renter_id"
    t.index ["techget_id"], name: "index_rentals_on_techget_id"
  end

  create_table "techgets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_techgets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.bigint "chat_room_id"
    t.index ["chat_room_id"], name: "index_users_on_chat_room_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_rooms", "rentals"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "rentals", "techgets"
  add_foreign_key "rentals", "users", column: "rentee_id"
  add_foreign_key "rentals", "users", column: "renter_id"
  add_foreign_key "techgets", "users"
  add_foreign_key "users", "chat_rooms"
end
