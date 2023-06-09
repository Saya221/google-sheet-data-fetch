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

ActiveRecord::Schema[7.0].define(version: 2023_06_05_073855) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer_number"
    t.text "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buttons", force: :cascade do |t|
    t.string "button_number"
    t.string "button_name"
    t.string "button_action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.integer "faq_type", default: 0
    t.string "intent"
    t.text "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs_resourceables", force: :cascade do |t|
    t.bigint "faq_id"
    t.string "resourceable_type"
    t.bigint "resourceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faq_id"], name: "index_faqs_resourceables_on_faq_id"
    t.index ["resourceable_type", "resourceable_id"], name: "index_faqs_resourceables_on_resourceable"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_encrypted", null: false
    t.integer "role", default: 1
    t.integer "status", default: 0
    t.datetime "confirmed_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
