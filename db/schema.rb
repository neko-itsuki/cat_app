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

ActiveRecord::Schema.define(version: 2021_03_03_101713) do

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cat_image", null: false
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
    t.string "tel", null: false
    t.string "care_time"
    t.string "close_date"
    t.string "acces"
    t.string "url"
    t.text "director_word"
    t.integer "postcode", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dog_image", null: false
    t.index ["center_id", "created_at"], name: "index_dogs_on_center_id_and_created_at"
    t.index ["center_id"], name: "index_dogs_on_center_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.boolean "is_user", null: false
    t.integer "message_id", null: false
    t.boolean "checked", default: false, null: false
  end

  create_table "user_messages", force: :cascade do |t|
    t.integer "user_room_id", null: false
    t.integer "user_id"
    t.integer "center_id"
    t.text "user_message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_user_messages_on_center_id"
    t.index ["user_id"], name: "index_user_messages_on_user_id"
    t.index ["user_room_id"], name: "index_user_messages_on_user_room_id"
  end

  create_table "user_rooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "center_id"
    t.integer "cat_id"
    t.integer "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cat_id"], name: "index_user_rooms_on_cat_id"
    t.index ["center_id"], name: "index_user_rooms_on_center_id"
    t.index ["dog_id"], name: "index_user_rooms_on_dog_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
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
    t.string "tel", null: false
    t.boolean "pets_allowed"
    t.boolean "living"
    t.boolean "vaccination"
    t.integer "postcode", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cats", "centers"
  add_foreign_key "dogs", "centers"
  add_foreign_key "user_messages", "centers"
  add_foreign_key "user_messages", "user_rooms"
  add_foreign_key "user_messages", "users"
  add_foreign_key "user_rooms", "centers"
  add_foreign_key "user_rooms", "users"
end
