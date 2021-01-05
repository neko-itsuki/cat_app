# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_05_100945) do

  # create_table "cats", force: :cascade do |t|
  #   t.integer "user_id", null: false
  #   t.string "name", default: "", null: false
  #   t.string "kind"
  #   t.string "gender"
  #   t.string "age"
  #   t.string "whight"
  #   t.string "coat_color"
  #   t.string "contraceptive"
  #   t.string "microchip"
  #   t.string "accinated"
  #   t.string "health_status"
  #   t.string "personality"
  #   t.string "background_of_protection"
  #   t.text "remarks"
  #   t.text "one_thing"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.index ["user_id", "created_at"], name: "index_cats_on_user_id_and_created_at"
  #   t.index ["user_id"], name: "index_cats_on_user_id"
  # end

  # create_table "dogs", force: :cascade do |t|
  #   t.integer "user_id", null: false
  #   t.string "name", default: "", null: false
  #   t.string "kind"
  #   t.string "gender"
  #   t.string "age"
  #   t.string "whight"
  #   t.string "coat_color"
  #   t.string "contraceptive"
  #   t.string "microchip"
  #   t.string "accinated"
  #   t.string "health_status"
  #   t.string "personality"
  #   t.string "background_of_protection"
  #   t.text "remarks"
  #   t.text "one_thing"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.index ["user_id", "created_at"], name: "index_dogs_on_user_id_and_created_at"
  #   t.index ["user_id"], name: "index_dogs_on_user_id"
  # end

  create_table "foster_parent_recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_foster_parent_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_foster_parent_recruiters_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  # add_foreign_key "cats", "users"
  # add_foreign_key "dogs", "users"
end
