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

ActiveRecord::Schema.define(version: 20180504000206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "street_num"
    t.integer "unit_num"
    t.string "street_name"
    t.string "street_type"
    t.string "address_type"
    t.string "address_identifier"
    t.string "city_suburb"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.string "latitude"
    t.string "longitude"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "profile_photo"
    t.string "albumable_type"
    t.bigint "albumable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["albumable_type", "albumable_id"], name: "index_albums_on_albumable_type_and_albumable_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date_from"
    t.date "date_to"
    t.integer "total_days"
    t.float "total_cost"
    t.datetime "date_paid"
    t.boolean "paid"
    t.string "description"
    t.bigint "user_id"
    t.bigint "share_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_space_id"], name: "index_bookings_on_share_space_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string "occupation"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_occupations_on_industry_id"
  end

  create_table "perks", force: :cascade do |t|
    t.string "perk"
    t.bigint "sharespace_venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sharespace_venue_id"], name: "index_perks_on_sharespace_venue_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.string "caption"
    t.string "photoable_type"
    t.bigint "photoable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photoable_type", "photoable_id"], name: "index_photos_on_photoable_type_and_photoable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.text "review"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sharespace_venues", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "brief_description"
    t.text "description"
    t.text "rules"
    t.text "surrounding_area_description"
    t.integer "profile_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sharespace_venues_on_user_id"
  end

  create_table "sharespaces", force: :cascade do |t|
    t.string "space_type"
    t.text "description"
    t.float "cost"
    t.integer "profile_photo"
    t.bigint "sharespace_venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sharespace_venue_id"], name: "index_sharespaces_on_sharespace_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.integer "phone_number"
    t.string "street_address"
    t.text "description"
    t.string "emergency_contact_name"
    t.integer "emergency_contact_number"
    t.string "emergency_contact_relationship"
    t.string "gender"
    t.integer "profile_photo"
    t.bigint "occupation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["occupation_id"], name: "index_users_on_occupation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "occupations", "industries"
  add_foreign_key "perks", "sharespace_venues"
  add_foreign_key "reviews", "users"
  add_foreign_key "sharespace_venues", "users"
  add_foreign_key "sharespaces", "sharespace_venues"
  add_foreign_key "users", "occupations"
end
