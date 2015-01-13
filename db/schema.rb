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

ActiveRecord::Schema.define(version: 20150113172250) do

  create_table "event_dates", force: true do |t|
    t.datetime "datetime"
    t.integer  "event_id"
    t.string   "url"
    t.boolean  "sold_out"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_festival"
  end

  add_index "event_dates", ["event_id"], name: "index_event_dates_on_event_id", using: :btree

  create_table "event_places", force: true do |t|
    t.string   "name"
    t.float    "longitude",  limit: 24
    t.float    "latitude",   limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: true do |t|
    t.string   "title_no"
    t.string   "title_en"
    t.integer  "event_type_id"
    t.integer  "price_member"
    t.integer  "price_other"
    t.text     "body_no"
    t.text     "body_en"
    t.boolean  "deleted"
    t.integer  "weight"
    t.datetime "publish_at"
    t.integer  "event_place_id"
    t.text     "sidebar"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_front_file_name"
    t.string   "image_front_content_type"
    t.integer  "image_front_file_size"
    t.datetime "image_front_updated_at"
  end

  add_index "events", ["event_place_id"], name: "index_events_on_event_place_id", using: :btree
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree

  create_table "groups", id: false, force: true do |t|
    t.integer "id",                          default: 0, null: false
    t.string  "name_en"
    t.string  "name_no"
    t.integer "section_id"
    t.integer "festival_id"
    t.string  "email",          limit: 1000
    t.string  "tag",                                     null: false
    t.text    "description_en"
    t.text    "description_no"
  end

  create_table "groups_positions", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "position_id"
  end

  create_table "positions", id: false, force: true do |t|
    t.integer  "id",             default: 0, null: false
    t.string   "title_en"
    t.string   "title_no"
    t.integer  "user_id"
    t.text     "description_en"
    t.text     "description_no"
    t.string   "group_dn"
    t.integer  "admission_id"
    t.integer  "group_id"
    t.integer  "number",         default: 1, null: false
    t.datetime "publish_from"
    t.datetime "publish_to"
  end

  create_table "positions_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "position_id", null: false
  end

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_id"
    t.text     "embed"
    t.integer  "box_height"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "speakers", ["event_id"], name: "index_speakers_on_event_id", using: :btree

  create_table "users", id: false, force: true do |t|
    t.integer  "id",                                     default: 0, null: false
    t.string   "given_name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.string   "phone"
    t.string   "address"
    t.integer  "postal_code"
    t.integer  "country_id"
    t.string   "next_of_kin_name"
    t.string   "next_of_kin_tlf"
    t.text     "tasks"
    t.string   "study"
    t.integer  "study_place_id"
    t.string   "private_email"
    t.integer  "cardnumber_ntnu"
    t.integer  "cardnumber_samfundet"
    t.string   "city"
    t.string   "username"
    t.integer  "ldap_id"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.integer  "has_skies"
    t.integer  "shoe_size"
    t.integer  "have_group_card"
    t.text     "media_contacts"
    t.string   "local_paper"
    t.integer  "vegetarian",                   limit: 1
    t.integer  "lactose_allergy",              limit: 1
    t.integer  "gluten_allergy",               limit: 1
    t.integer  "nut_allergy",                  limit: 1
    t.integer  "fruit_allergy",                limit: 1
    t.text     "other_allergy"
    t.integer  "no_allergy",                   limit: 1
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_username"
    t.string   "facebook_id"
    t.string   "facebook_token"
  end

end
