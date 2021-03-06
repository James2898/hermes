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

ActiveRecord::Schema.define(version: 2020_12_27_222005) do

  create_table "employees", force: :cascade do |t|
    t.integer "shop_id"
    t.string "first_name"
    t.string "last_name"
    t.string "contact"
    t.string "address"
    t.string "email"
    t.integer "employee_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_employees_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "employee_id"
    t.string "shop_name"
    t.integer "plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_shops_on_employee_id"
  end

end
