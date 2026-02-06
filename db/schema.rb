# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_06_185750) do
  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "sock_1_id"
    t.integer "sock_2_id"
    t.datetime "updated_at", null: false
    t.index ["sock_1_id"], name: "index_matches_on_sock_1_id"
    t.index ["sock_2_id"], name: "index_matches_on_sock_2_id"
  end

  create_table "socks", force: :cascade do |t|
    t.integer "age"
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "gender"
    t.string "height"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "socks", column: "sock_1_id"
  add_foreign_key "matches", "socks", column: "sock_2_id"
end
