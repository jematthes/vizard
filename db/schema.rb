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

ActiveRecord::Schema.define(version: 20150821185316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "objective_id"
    t.datetime "scheduling"
    t.boolean  "completion"
  end

  create_table "activities_asks", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "ask_id",      null: false
  end

  create_table "activities_outcomes", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "outcome_id",  null: false
  end

  add_index "activities_outcomes", ["activity_id", "outcome_id"], name: "index_activities_outcomes_on_activity_id_and_outcome_id", using: :btree
  add_index "activities_outcomes", ["outcome_id", "activity_id"], name: "index_activities_outcomes_on_outcome_id_and_activity_id", using: :btree

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "actor_type"
    t.integer  "support"
    t.integer  "influence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "important"
  end

  create_table "actors_objectives", id: false, force: :cascade do |t|
    t.integer "actor_id",     null: false
    t.integer "objective_id", null: false
  end

  create_table "asks", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "actor_id"
    t.integer  "objective_id"
    t.boolean  "execution"
  end

  add_index "asks", ["actor_id"], name: "index_asks_on_actor_id", using: :btree
  add_index "asks", ["objective_id"], name: "index_asks_on_objective_id", using: :btree

  create_table "objectives", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "prioritized"
    t.integer  "project_id"
    t.string   "barriers",                     default: [], array: true
    t.string   "enabling_factors",             default: [], array: true
    t.integer  "big_difference_score"
    t.string   "big_difference_arguments"
    t.integer  "multiplying_effect_score"
    t.string   "multiplying_effect_arguments"
    t.integer  "catalytic_score"
    t.string   "catalytic_arguments"
    t.integer  "demand_score"
    t.string   "demand_arguments"
    t.integer  "hooks_processes_score"
    t.string   "hooks_processes_arguments"
    t.integer  "intuitive_score"
    t.string   "intuitive_arguments"
    t.integer  "alignment_score"
    t.string   "alignment_arguments"
    t.integer  "loss_gain_score"
    t.string   "loss_gain_arguments"
    t.integer  "added_value_score"
    t.integer  "added_value_arguments"
    t.string   "objective_type"
  end

  add_index "objectives", ["project_id"], name: "index_objectives_on_project_id", using: :btree

  create_table "objectives_solutions", id: false, force: :cascade do |t|
    t.integer "objective_id", null: false
    t.integer "solution_id",  null: false
  end

  add_index "objectives_solutions", ["objective_id", "solution_id"], name: "index_objectives_solutions_on_objective_id_and_solution_id", using: :btree
  add_index "objectives_solutions", ["solution_id", "objective_id"], name: "index_objectives_solutions_on_solution_id_and_objective_id", using: :btree

  create_table "outcomes", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "outcome_type_id"
    t.text     "actor_type_id"
    t.string   "categorie"
  end

  add_index "outcomes", ["objective_id"], name: "index_outcomes_on_objective_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "permissions", ["project_id"], name: "index_permissions_on_project_id", using: :btree

  create_table "policy_problems", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "real_problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "policy_problems", ["real_problem_id"], name: "index_policy_problems_on_real_problem_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
    t.string   "focus_area"
  end

  create_table "real_problems", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.text     "focus_area"
    t.text     "goal"
  end

  add_index "real_problems", ["project_id"], name: "index_real_problems_on_project_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "public"
    t.string   "link"
  end

  add_index "resources", ["project_id"], name: "index_resources_on_project_id", using: :btree

  create_table "sandboxes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "graph_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "public"
  end

  add_index "sandboxes", ["user_id"], name: "index_sandboxes_on_user_id", using: :btree

  create_table "solutions", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "policy_problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["policy_problem_id"], name: "index_solutions_on_policy_problem_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
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
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "asks", "actors"
  add_foreign_key "asks", "objectives"
  add_foreign_key "permissions", "projects"
end
