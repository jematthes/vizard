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

ActiveRecord::Schema.define(version: 20141022201627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "other_names", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "people_id"
  end

  add_index "other_names", ["people_id"], name: "index_other_names_on_people_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.datetime "birth_date"
    t.datetime "death_date"
    t.string   "image"
    t.string   "summary"
    t.text     "biography"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sandboxes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "graph_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
