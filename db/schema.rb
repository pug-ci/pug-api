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

ActiveRecord::Schema.define(version: 20161204190302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: :cascade do |t|
    t.integer  "repository_id"
    t.string   "status",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["repository_id"], name: "index_builds_on_repository_id", using: :btree
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "github_id",  null: false
    t.string   "token",      null: false
    t.string   "name",       null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_id"], name: "index_repositories_on_github_id", unique: true, using: :btree
    t.index ["token"], name: "index_repositories_on_token", unique: true, using: :btree
  end

  create_table "repositories_users", force: :cascade do |t|
    t.integer  "repository_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["repository_id", "user_id"], name: "index_repositories_users_on_repository_id_and_user_id", unique: true, using: :btree
    t.index ["repository_id"], name: "index_repositories_users_on_repository_id", using: :btree
    t.index ["user_id"], name: "index_repositories_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",         null: false
    t.string   "uid",              null: false
    t.string   "name",             null: false
    t.string   "oauth_token",      null: false
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  end

  add_foreign_key "builds", "repositories"
  add_foreign_key "repositories_users", "repositories"
  add_foreign_key "repositories_users", "users"
end
