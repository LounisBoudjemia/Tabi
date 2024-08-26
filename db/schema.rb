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

ActiveRecord::Schema[7.1].define(version: 2024_08_26_144518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.string "category"
    t.text "description"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklist_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "checklistable_type", null: false
    t.bigint "checklistable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklistable_type", "checklistable_id"], name: "index_checklist_items_on_checklistable"
    t.index ["item_id"], name: "index_checklist_items_on_item_id"
  end

  create_table "checklist_templates", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_checklist_templates_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_checklists_on_trip_id"
  end

  create_table "diary_entries", force: :cascade do |t|
    t.string "headline"
    t.text "content"
    t.date "date"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_diary_entries_on_trip_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_stops_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
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

  add_foreign_key "checklist_items", "items"
  add_foreign_key "checklist_templates", "users"
  add_foreign_key "checklists", "trips"
  add_foreign_key "diary_entries", "trips"
  add_foreign_key "stops", "trips"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
