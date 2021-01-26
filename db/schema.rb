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

ActiveRecord::Schema.define(version: 2021_01_25_111507) do

  create_table "cats", force: :cascade do |t|
    t.integer "center_id", null: false
    t.string "cat_name", null: false
    t.string "cat_type", null: false
    t.boolean "cat_gender", null: false
    t.string "cat_age", null: false
    t.string "cat_weight", null: false
    t.string "cat_coat_color", null: false
    t.boolean "cat_contraceptive_castrated", null: false
    t.boolean "cat_microchip", null: false
    t.boolean "cat_vaccination", null: false
    t.text "cat_one_thing", null: false
    t.text "cat_health", null: false
    t.text "cat_personality", null: false
    t.text "cat_history_of_protection", null: false
    t.text "cat_remarks"
    t.text "cat_center_information", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id", "created_at"], name: "index_cats_on_center_id_and_created_at"
    t.index ["center_id"], name: "index_cats_on_center_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "furigana_name", null: false
    t.string "director_name", null: false
    t.string "staff_name", null: false
    t.string "street_address", null: false
    t.string "tel", null: false
    t.string "care_time"
    t.string "close_date"
    t.string "acces"
    t.string "url"
    t.text "director_word"
    t.index ["email"], name: "index_centers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_centers_on_reset_password_token", unique: true
  end

  create_table "dogs", force: :cascade do |t|
    t.integer "center_id", null: false
    t.string "dog_name", null: false
    t.string "dog_type", null: false
    t.boolean "dog_gender", null: false
    t.string "dog_age", null: false
    t.string "dog_weight", null: false
    t.string "dog_coat_color", null: false
    t.boolean "dog_contraceptive_castrated", null: false
    t.boolean "dog_microchip", null: false
    t.boolean "dog_vaccination", null: false
    t.text "dog_one_thing", null: false
    t.text "dog_health", null: false
    t.text "dog_personality", null: false
    t.text "dog_history_of_protection", null: false
    t.text "dog_remarks"
    t.text "dog_center_information", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id", "created_at"], name: "index_dogs_on_center_id_and_created_at"
    t.index ["center_id"], name: "index_dogs_on_center_id"
  end

  create_table "foster_parent_recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "furigana_name", null: false
    t.integer "age", null: false
    t.boolean "gender", null: false
    t.string "street_address", null: false
    t.string "tel", null: false
    t.string "tel_time"
    t.string "animal_type", null: false
    t.string "animal_gender", null: false
    t.string "animal_age", null: false
    t.string "animal_image", null: false
    t.string "reason", null: false
    t.index ["email"], name: "index_foster_parent_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_foster_parent_recruiters_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "furigana_name", null: false
    t.integer "age", null: false
    t.boolean "gender", null: false
    t.string "street_address", null: false
    t.string "tel", null: false
    t.boolean "pets_allowed"
    t.boolean "living"
    t.boolean "vaccination"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cats", "centers"
  add_foreign_key "dogs", "centers"
end
