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

ActiveRecord::Schema.define(version: 2021_12_03_073609) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.integer "total_seats"
    t.string "box_office_customers"
    t.integer "total_seats_box_office"
    t.integer "total_seats_guest"
    t.integer "balance"
    t.string "seat_category"
  end

  create_table "guests", force: :cascade do |t|
    t.string "email_address"
    t.string "first_name"
    t.string "last_name"
    t.string "affiliation"
    t.string "added_by"
    t.string "guest_type"
    t.string "seat_category"
    t.integer "max_seats_num"
    t.string "booking_status", default: "Not invited"
    t.integer "total_booked_num", default: 0
    t.integer "event_id"
    t.index ["event_id"], name: "index_guests_on_event_id"
  end

  create_table "seat_category_details", force: :cascade do |t|
    t.string "event_title"
    t.string "seat_category"
    t.integer "total_seats"
    t.integer "vip_seats"
    t.integer "non_vip_seats"
    t.integer "balance"
  end

  create_table "seating_types", force: :cascade do |t|
    t.integer "total_seat_count"
    t.integer "vip_seat_count"
    t.integer "box_office_seat_count"
    t.integer "balance_seats"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seat_category"
    t.index ["event_id"], name: "index_seating_types_on_event_id"
    t.index ["seat_category"], name: "index_seating_types_on_seat_category", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
