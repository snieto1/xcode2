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

ActiveRecord::Schema.define(version: 20160802205641) do

  create_table "bottles", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_bottles_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "club_name"
    t.string   "contact_person"
    t.string   "club_phone_number"
    t.string   "club_email"
    t.string   "password_digest"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "reservation_bottles", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "bottle_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bottle_id"], name: "index_reservation_bottles_on_bottle_id"
    t.index ["reservation_id"], name: "index_reservation_bottles_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_reservations_on_table_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string   "table_name"
    t.string   "minimum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "clubs_id"
    t.integer  "club_id"
    t.index ["club_id"], name: "index_tables_on_club_id"
    t.index ["clubs_id"], name: "index_tables_on_clubs_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
