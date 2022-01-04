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


ActiveRecord::Schema.define(version: 2021_12_31_035419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_stacks", force: :cascade do |t|
    t.string "title", null: false
    t.integer "amount"
    t.integer "status", default: 0, null: false
    t.date "date", null: false
    t.integer "unit", null: false
    t.bigint "expense_category_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_category_id"], name: "index_daily_stacks_on_expense_category_id"
    t.index ["user_id"], name: "index_daily_stacks_on_user_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "delete_flag", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_expense_categories_on_user_id"
  end

  create_table "monthly_targets", force: :cascade do |t|
    t.string "title", null: false
    t.integer "amount", null: false
    t.date "month", null: false
    t.integer "unit", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_monthly_targets_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "date", null: false
    t.time "time", null: false
    t.integer "label_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.text "content", null: false
    t.string "month"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_topics_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "daily_stacks", "expense_categories"
  add_foreign_key "daily_stacks", "users"
  add_foreign_key "expense_categories", "users"
  add_foreign_key "monthly_targets", "users"
  add_foreign_key "topics", "users", column: "users_id"
  add_foreign_key "schedules", "users"
end
