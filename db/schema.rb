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

ActiveRecord::Schema.define(version: 2021_11_29_204818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clucks", force: :cascade do |t|
    t.string "username", limit: 255
    t.text "image_url"
    t.text "content"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "geos", force: :cascade do |t|
    t.string "place"
    t.string "latlng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "linked_id"
    t.string "title"
    t.string "company"
    t.string "place"
    t.string "date"
    t.text "link"
    t.string "senoritylevel"
    t.string "function"
    t.string "employmenttype"
    t.string "industries"
    t.string "salary"
    t.text "required_skills"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "check_count"
    t.text "skills_keyword"
  end

  create_table "migrations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "batch"
    t.datetime "migration_time"
  end

  create_table "migrations_lock", primary_key: "index", id: :serial, force: :cascade do |t|
    t.integer "is_locked"
  end

  create_table "trending", id: false, force: :cascade do |t|
    t.string "trend", limit: 255
    t.integer "count"
  end

end
