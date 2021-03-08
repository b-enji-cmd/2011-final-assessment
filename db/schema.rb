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

ActiveRecord::Schema.define(version: 2021_03_08_161902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.integer "years_practiced"
    t.string "uni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "surgery_id"
    t.index ["surgery_id"], name: "index_doctors_on_surgery_id"
  end

  create_table "surgeries", force: :cascade do |t|
    t.string "title"
    t.string "day"
    t.integer "room"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_surgeries_on_doctor_id"
  end

  add_foreign_key "doctors", "surgeries"
  add_foreign_key "surgeries", "doctors"
end