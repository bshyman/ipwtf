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

ActiveRecord::Schema.define(version: 20190429035011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interfaces", force: :cascade do |t|
    t.string "ip", limit: 15
    t.string "scope"
    t.string "ddns"
    t.bigint "port"
    t.datetime "last_responded_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "last_external_ip"
    t.string "last_response"
    t.index ["user_id"], name: "index_interfaces_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "type"
    t.text "content"
    t.integer "created_by"
    t.bigint "interface_id"
    t.boolean "encrypted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interface_id"], name: "index_notes_on_interface_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "refresh_interval"
    t.string "theme"
    t.boolean "unsubscribed", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "name", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "password_digest"
  end

end
