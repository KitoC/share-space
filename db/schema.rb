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

ActiveRecord::Schema.define(version: 20180501115809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genders", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "location_addresses", force: :cascade do |t|
    t.string "city_suburb"
    t.string "state"
    t.string "country"
    t.integer "postcode"
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

  create_table "schools", force: :cascade do |t|
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_photos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "img_url"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_photos_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
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
    t.integer "overall_rating"
    t.string "emergency_contact_name"
    t.integer "emergency_contact_number"
    t.string "emergency_contact_relationship"
    t.bigint "gender_id"
    t.bigint "occupation_id"
    t.bigint "location_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["location_address_id"], name: "index_users_on_location_address_id"
    t.index ["occupation_id"], name: "index_users_on_occupation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "occupations", "industries"
  add_foreign_key "user_photos", "users"
  add_foreign_key "user_reviews", "users"
  add_foreign_key "users", "genders"
  add_foreign_key "users", "location_addresses"
  add_foreign_key "users", "occupations"
end
