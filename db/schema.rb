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

ActiveRecord::Schema.define(version: 20150803180813) do

  create_table "aliases", force: :cascade do |t|
    t.string   "name"
    t.string   "responsible"
    t.text     "goto"
    t.integer  "domain_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "aliases", ["domain_id"], name: "index_aliases_on_domain_id"
  add_index "aliases", ["name"], name: "index_aliases_on_name", unique: true

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "domains", ["name"], name: "index_domains_on_name", unique: true

  create_table "formats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forwarders", force: :cascade do |t|
    t.string   "name"
    t.string   "responsible"
    t.text     "goto"
    t.integer  "domain_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "forwarders", ["domain_id"], name: "index_forwarders_on_domain_id"
  add_index "forwarders", ["name"], name: "index_forwarders_on_name", unique: true

  create_table "mailboxes", force: :cascade do |t|
    t.string   "username",   limit: 32
    t.string   "password"
    t.string   "name",       limit: 32
    t.boolean  "active"
    t.datetime "lastlogin"
    t.date     "expires"
    t.integer  "domain_id"
    t.integer  "format_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "mailboxes", ["domain_id"], name: "index_mailboxes_on_domain_id"
  add_index "mailboxes", ["format_id"], name: "index_mailboxes_on_format_id"
  add_index "mailboxes", ["username"], name: "index_mailboxes_on_username", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
