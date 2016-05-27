# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160527123919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "type"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "attachment"
    t.string   "original_filename"
    t.string   "content_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "landmarks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "location_categories", force: :cascade do |t|
    t.string  "name"
    t.integer "position"
  end

  create_table "location_tags", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id", "tag_id"], name: "index_location_tags_on_location_id_and_tag_id", using: :btree
    t.index ["tag_id"], name: "index_location_tags_on_tag_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.string  "address"
    t.string  "phone_number"
    t.text    "hours"
    t.text    "notes"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "location_category_id"
  end

  create_table "staff_members", force: :cascade do |t|
    t.integer "location_id"
    t.string  "name"
    t.string  "position",    default: "Staff Member"
    t.boolean "active",      default: true
    t.index ["location_id"], name: "index_staff_members_on_location_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
  end

end
