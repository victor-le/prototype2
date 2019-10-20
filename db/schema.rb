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

ActiveRecord::Schema.define(version: 2019_10_19_160141) do

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
    t.decimal "durationPrice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "app_schedules", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "appaddress_id", null: false
    t.integer "apptime_id", null: false
    t.integer "service_id", null: false
    t.integer "appduration_id", null: false
    t.integer "specialrequirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appaddress_id"], name: "index_app_schedules_on_appaddress_id"
    t.index ["appduration_id"], name: "index_app_schedules_on_appduration_id"
    t.index ["apptime_id"], name: "index_app_schedules_on_apptime_id"
    t.index ["client_id"], name: "index_app_schedules_on_client_id"
    t.index ["service_id"], name: "index_app_schedules_on_service_id"
    t.index ["specialrequirement_id"], name: "index_app_schedules_on_specialrequirement_id"
  end

  create_table "app_times", force: :cascade do |t|
    t.datetime "appDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_addresses", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "appaddress_id", null: false
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appaddress_id"], name: "index_client_addresses_on_appaddress_id"
    t.index ["client_id"], name: "index_client_addresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "clientFName"
    t.string "clientLName"
    t.string "clientEmail"
    t.string "clientPhone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "services", force: :cascade do |t|
    t.string "serviceName"
    t.decimal "servicePrice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "special_requirements", force: :cascade do |t|
    t.string "requirementDesc"
    t.string "requirementValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_schedules", "appaddresses"
  add_foreign_key "app_schedules", "appdurations"
  add_foreign_key "app_schedules", "apptimes"
  add_foreign_key "app_schedules", "clients"
  add_foreign_key "app_schedules", "services"
  add_foreign_key "app_schedules", "specialrequirements"
  add_foreign_key "client_addresses", "appaddresses"
  add_foreign_key "client_addresses", "clients"
end
