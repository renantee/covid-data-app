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

ActiveRecord::Schema.define(version: 2021_06_10_112250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.string "iso2"
    t.string "iso3"
    t.string "numeric_code"
    t.string "latitude_average"
    t.string "longitude_average"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "csv_vaccinations", force: :cascade do |t|
    t.string "country"
    t.string "iso3"
    t.string "who_region"
    t.string "data_source"
    t.date "date_updated"
    t.integer "total_vaccinations"
    t.integer "persons_vaccinated_1plus_dose"
    t.float "total_vaccinations_per100"
    t.float "persons_vaccinated_1plus_dose_per100"
    t.string "vaccines_used"
    t.date "first_vaccine_date"
    t.string "number_vaccines_types_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "is_admin"
    t.bigint "country_id", default: 179, null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccination_details", force: :cascade do |t|
    t.bigint "vaccination_id", null: false
    t.bigint "vaccine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vaccination_id"], name: "index_vaccination_details_on_vaccination_id"
    t.index ["vaccine_id"], name: "index_vaccination_details_on_vaccine_id"
  end

  create_table "vaccinations", force: :cascade do |t|
    t.string "who_region"
    t.date "date_updated"
    t.integer "total_vaccinations"
    t.integer "persons_vaccinated_1plus_dose"
    t.float "total_vaccinations_per100"
    t.float "persons_vaccinated_1plus_dose_per100"
    t.date "first_vaccine_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_vaccinations_on_country_id"
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "iso3"
    t.string "vaccine_name"
    t.string "product_name"
    t.string "company_name"
    t.date "authorization_date"
    t.date "start_date"
    t.date "end_date"
    t.string "comment"
    t.integer "data_source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "users", "countries"
  add_foreign_key "vaccination_details", "vaccinations"
  add_foreign_key "vaccination_details", "vaccines"
  add_foreign_key "vaccinations", "countries"
end
