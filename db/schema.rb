ActiveRecord::Schema.define(version: 20151019003740) do
  enable_extension "plpgsql"
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
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
end
