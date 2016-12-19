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

ActiveRecord::Schema.define(version: 20161213005617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debuggers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ruby_version_id"
    t.integer  "puppet_version_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["puppet_version_id"], name: "index_debuggers_on_puppet_version_id", using: :btree
    t.index ["ruby_version_id"], name: "index_debuggers_on_ruby_version_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "puppet_module_debugger_assignments", force: :cascade do |t|
    t.integer "puppet_module_id"
    t.integer "debugger_id"
    t.index ["debugger_id"], name: "index_puppet_module_debugger_assignments_on_debugger_id", using: :btree
    t.index ["puppet_module_id"], name: "index_puppet_module_debugger_assignments_on_puppet_module_id", using: :btree
  end

  create_table "puppet_modules", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "uri"
    t.integer  "downloads"
    t.boolean  "supported"
    t.string   "homepage_url"
    t.string   "owner"
    t.string   "current_release_version"
    t.string   "release_supported"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "puppet_versions", force: :cascade do |t|
    t.string   "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_versions", force: :cascade do |t|
    t.string   "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_debugger_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "debugger_id"
    t.index ["debugger_id"], name: "index_user_debugger_assignments_on_debugger_id", using: :btree
    t.index ["user_id"], name: "index_user_debugger_assignments_on_user_id", using: :btree
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "debuggers", "puppet_versions"
  add_foreign_key "debuggers", "ruby_versions"
  add_foreign_key "profiles", "users"
  add_foreign_key "puppet_module_debugger_assignments", "debuggers"
  add_foreign_key "puppet_module_debugger_assignments", "puppet_modules"
  add_foreign_key "user_debugger_assignments", "debuggers"
  add_foreign_key "user_debugger_assignments", "users"
end
