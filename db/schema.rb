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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenge_attempts", force: true do |t|
    t.integer  "actor_id",                null: false
    t.integer  "challenge_id",            null: false
    t.string   "state",        limit: 32, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "repo"
    t.datetime "finished_at"
    t.integer  "cohort_id"
  end

  create_table "cohorts", force: true do |t|
    t.string   "name"
    t.integer  "location_id",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "in_session",  default: false
    t.date     "start_date",                  null: false
    t.string   "email"
    t.boolean  "visible",     default: true
    t.string   "slug"
  end

  create_table "user_groups", force: true do |t|
    t.string   "name",        null: false
    t.integer  "users_count", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_groups_users", force: true do |t|
    t.integer "user_group_id", null: false
    t.integer "user_id",       null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "cohort_id"
    t.string   "password_digest"
    t.integer  "roles_mask"
    t.string   "github_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.datetime "disabled_at"
  end

end
