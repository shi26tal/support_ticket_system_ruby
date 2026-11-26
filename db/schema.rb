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

ActiveRecord::Schema[8.1].define(version: 2026_11_26_082353) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "agent_categories", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id", "category_id"], name: "index_agent_categories_on_agent_id_and_category_id", unique: true
    t.index ["agent_id"], name: "index_agent_categories_on_agent_id"
    t.index ["category_id"], name: "index_agent_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_messages_on_ticket_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "subject", null: false
    t.text "description", null: false
    t.string "status", null: false
    t.bigint "customer_id", null: false
    t.bigint "assigned_to_id"
    t.bigint "category_id", null: false
    t.datetime "resolved_at"
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_tickets_on_assigned_to_id"
    t.index ["category_id"], name: "index_tickets_on_category_id"
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "CUSTOMER", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "agent_categories", "categories"
  add_foreign_key "agent_categories", "users", column: "agent_id"
  add_foreign_key "messages", "tickets"
  add_foreign_key "messages", "users"
  add_foreign_key "tickets", "categories"
  add_foreign_key "tickets", "users", column: "assigned_to_id"
  add_foreign_key "tickets", "users", column: "customer_id"
end
