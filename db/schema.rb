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

ActiveRecord::Schema.define(version: 2019_11_09_031739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_addresses", force: :cascade do |t|
    t.string "homeType"
    t.string "homeAddress"
    t.string "suiteNumber"
    t.string "state"
    t.string "city"
    t.integer "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "app_durations", force: :cascade do |t|
    t.integer "duration"
    t.integer "durationPrice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "app_schedules", force: :cascade do |t|
    t.string "homeAddress"
    t.string "homeType"
    t.string "suiteNumber"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "appDate"
    t.integer "user_id"
    t.integer "service_id"
    t.integer "appduration_id"
    t.integer "specialrequirement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "app_time_id"
    t.string "comment"
    t.index ["app_time_id"], name: "index_app_schedules_on_app_time_id"
    t.index ["appduration_id"], name: "index_app_schedules_on_appduration_id"
    t.index ["service_id"], name: "index_app_schedules_on_service_id"
    t.index ["specialrequirement_id"], name: "index_app_schedules_on_specialrequirement_id"
    t.index ["user_id"], name: "index_app_schedules_on_user_id"
  end

  create_table "app_times", force: :cascade do |t|
    t.datetime "appDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "booked", default: false, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "inbox_tables", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "serviceName"
    t.integer "servicePrice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "special_requirements", force: :cascade do |t|
    t.string "requirementDesc"
    t.integer "requirementValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_schedules", "app_times"
end
