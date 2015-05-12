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

ActiveRecord::Schema.define(version: 20150504202428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_outcomes", id: false, force: true do |t|
    t.integer "activity_id", null: false
    t.integer "outcome_id",  null: false
  end

  add_index "activities_outcomes", ["activity_id", "outcome_id"], name: "index_activities_outcomes_on_activity_id_and_outcome_id", using: :btree
  add_index "activities_outcomes", ["outcome_id", "activity_id"], name: "index_activities_outcomes_on_outcome_id_and_activity_id", using: :btree

  create_table "actors", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "actor_type"
    t.integer  "support"
    t.integer  "influence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asks", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asks", ["activity_id"], name: "index_asks_on_activity_id", using: :btree

  create_table "objectives", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "prioritized"
  end

  create_table "objectives_solutions", id: false, force: true do |t|
    t.integer "objective_id", null: false
    t.integer "solution_id",  null: false
  end

  add_index "objectives_solutions", ["objective_id", "solution_id"], name: "index_objectives_solutions_on_objective_id_and_solution_id", using: :btree
  add_index "objectives_solutions", ["solution_id", "objective_id"], name: "index_objectives_solutions_on_solution_id_and_objective_id", using: :btree

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

  create_table "outcomes", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "outcome_type_id"
    t.integer  "actor_type_id"
  end

  add_index "outcomes", ["objective_id"], name: "index_outcomes_on_objective_id", using: :btree

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

  create_table "policy_problems", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "real_problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "policy_problems", ["real_problem_id"], name: "index_policy_problems_on_real_problem_id", using: :btree

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
  end

  create_table "real_problems", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
  end

  add_index "resources", ["project_id"], name: "index_resources_on_project_id", using: :btree

  create_table "sandboxes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "graph_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "public"
  end

  add_index "sandboxes", ["user_id"], name: "index_sandboxes_on_user_id", using: :btree

  create_table "solutions", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "policy_problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["policy_problem_id"], name: "index_solutions_on_policy_problem_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
