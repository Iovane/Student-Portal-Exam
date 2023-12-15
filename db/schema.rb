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

ActiveRecord::Schema[7.0].define(version: 2023_12_15_094039) do
  create_table "lecturers", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id", null: false
    t.time "from_time"
    t.time "to_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "scheduled_date"
    t.index ["subject_id"], name: "index_lecturers_on_subject_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "questions_list"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request_code"
    t.integer "user_id"
    t.integer "lecturer_id"
    t.time "chosen_start"
    t.time "chosen_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "scheduled_date"
    t.index ["lecturer_id"], name: "index_requests_on_lecturer_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lecturers", "subjects"
  add_foreign_key "questions", "users"
  add_foreign_key "requests", "lecturers"
  add_foreign_key "requests", "users"
end
