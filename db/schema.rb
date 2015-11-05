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

ActiveRecord::Schema.define(version: 20151105175100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.string   "type",         null: false
    t.integer  "subject_id",   null: false
    t.string   "subject_type", null: false
    t.integer  "actor_id",     null: false
    t.integer  "target_id",    null: false
    t.string   "target_type",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "activities", ["actor_id"], name: "index_activities_on_actor_id", using: :btree
  add_index "activities", ["subject_type", "subject_id"], name: "index_activities_on_subject_type_and_subject_id", using: :btree
  add_index "activities", ["target_id"], name: "index_activities_on_target_id", using: :btree
  add_index "activities", ["target_type"], name: "index_activities_on_target_type", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "following_relationships", force: :cascade do |t|
    t.integer  "followed_user_id"
    t.integer  "follower_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "following_relationships", ["followed_user_id"], name: "index_following_relationships_on_followed_user_id", using: :btree
  add_index "following_relationships", ["follower_id"], name: "index_following_relationships_on_follower_id", using: :btree

  create_table "glitterings", force: :cascade do |t|
    t.integer  "glitterable_id"
    t.string   "glitterable_type"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "glitterings", ["glitterable_type", "glitterable_id"], name: "index_glitterings_on_glitterable_type_and_glitterable_id", using: :btree
  add_index "glitterings", ["user_id"], name: "index_glitterings_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                      null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "api_token",                  null: false
    t.string   "device_token"
    t.string   "username",        limit: 15, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
