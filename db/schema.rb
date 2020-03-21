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

ActiveRecord::Schema.define(version: 2020_03_21_084438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goods", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "source"
    t.string "destination"
    t.string "consignment_id"
    t.datetime "entry_at"
    t.datetime "exit_at"
    t.boolean "left_facility", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_goods_on_category"
    t.index ["consignment_id"], name: "index_goods_on_consignment_id", unique: true
    t.index ["destination"], name: "index_goods_on_destination"
    t.index ["entry_at"], name: "index_goods_on_entry_at"
    t.index ["exit_at"], name: "index_goods_on_exit_at"
    t.index ["left_facility"], name: "index_goods_on_left_facility"
    t.index ["name"], name: "index_goods_on_name"
    t.index ["source"], name: "index_goods_on_source"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
