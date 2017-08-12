# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170812004848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_customers_on_email", unique: true, using: :btree
    t.index ["stripe_id"], name: "index_customers_on_stripe_id", using: :btree
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "price"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_line_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "total"
    t.uuid     "uuid",        default: -> { "uuid_generate_v4()" }
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aasm_state"
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["uuid"], name: "index_orders_on_uuid", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.uuid     "sku"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shows", force: :cascade do |t|
    t.date     "date"
    t.string   "venue"
    t.string   "location"
    t.text     "info"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["date"], name: "index_shows_on_date", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
end
