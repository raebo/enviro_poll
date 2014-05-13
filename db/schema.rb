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

ActiveRecord::Schema.define(version: 20140512151048) do

  create_table "nace_codes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "description"
    t.string   "ancestry"
  end

  create_table "organisation_surveys", force: true do |t|
    t.integer  "organisation_id"
    t.integer  "survey_id"
    t.datetime "organisation_survey_date"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.integer  "topic_id"
    t.string   "question_title"
    t.text     "question_description"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "question_measurement"
  end

  create_table "results", force: true do |t|
    t.string   "result_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "survey_results", force: true do |t|
    t.integer  "organisation_survey_id"
    t.integer  "question_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "result_id"
  end

  create_table "surveys", force: true do |t|
    t.string   "survey_title"
    t.text     "survey_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "topic_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
