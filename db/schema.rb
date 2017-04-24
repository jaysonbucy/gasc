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

ActiveRecord::Schema.define(version: 20170414013538) do

  create_table "event_heats", force: :cascade do |t|
    t.integer  "swim_meet_id",  null: false
    t.integer  "swim_event_id", null: false
    t.integer  "heat_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["swim_event_id"], name: "index_event_heats_on_swim_event_id"
    t.index ["swim_meet_id"], name: "index_event_heats_on_swim_meet_id"
  end

  create_table "swim_events", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "distance_in_yards", null: false
    t.integer  "age_group_start",   null: false
    t.integer  "age_group_end",     null: false
    t.integer  "gender",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "swim_forms", force: :cascade do |t|
    t.string   "description",                 null: false
    t.string   "url",                         null: false
    t.boolean  "active",      default: false, null: false
    t.integer  "user_id",                     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_swim_forms_on_user_id"
  end

  create_table "swim_meets", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swim_times", force: :cascade do |t|
    t.integer  "event_heat_id",     null: false
    t.integer  "swimmer_detail_id", null: false
    t.decimal  "time_in_seconds",   null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["event_heat_id"], name: "index_swim_times_on_event_heat_id"
    t.index ["swimmer_detail_id"], name: "index_swim_times_on_swimmer_detail_id"
  end

  create_table "swimmer_details", force: :cascade do |t|
    t.string   "name",          null: false
    t.date     "date_of_birth", null: false
    t.integer  "gender",        null: false
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_swimmer_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
