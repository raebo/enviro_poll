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

ActiveRecord::Schema.define(version: 20140422120107) do

  create_table "nace_codes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "description"
  end

  create_table "organisations", force: true do |t|
    t.string   "organisation_name"
    t.string   "organisation_street"
    t.string   "organisation_street_number"
    t.string   "organisation_zipcode"
    t.string   "organisation_city"
    t.string   "organisation_country"
    t.string   "user_form_of_address"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_phone"
    t.string   "user_fax"
    t.string   "user_email"
    t.integer  "nace_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login_token"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
