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

ActiveRecord::Schema.define(version: 2021_01_21_181741) do

  create_table "activities", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float "mastery"
    t.float "pleasure"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "emotions", force: :cascade do |t|
    t.integer "scale"
    t.string "feelings"
    t.string "trigger"
    t.text "thought"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_emotions_on_user_id"
  end

  create_table "emotions_feelings", force: :cascade do |t|
    t.integer "feeling_id"
    t.integer "emotion_id"
    t.index ["emotion_id"], name: "index_emotions_feelings_on_emotion_id"
    t.index ["feeling_id"], name: "index_emotions_feelings_on_feeling_id"
  end

  create_table "feelings", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_feelings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
