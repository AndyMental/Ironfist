# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170315105341) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id"

  create_table "carts", force: :cascade do |t|
    t.integer  "shop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_active",  default: true
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "shop_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "shipping_address_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_properties", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "property_name"
    t.string   "property_value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id"

  create_table "product_reviews", force: :cascade do |t|
    t.text     "content"
    t.float    "rating"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.string   "name"
    t.float    "price"
    t.boolean  "private"
    t.text     "description"
    t.integer  "count"
    t.boolean  "is_featured"
    t.boolean  "is_active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "shop_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id"

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shipping_addresses", ["customer_id"], name: "index_shipping_addresses_on_customer_id"

  create_table "shops", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "domain",                       null: false
    t.integer  "theme_id"
    t.integer  "shop_owner_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_active",     default: true
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_active",   default: true
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "themes", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "phone"
    t.string   "type"
    t.string   "otp"
    t.string   "otp_verified_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wishlist_items", force: :cascade do |t|
    t.integer  "wishlist_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "wishlist_items", ["wishlist_id"], name: "index_wishlist_items_on_wishlist_id"

  create_table "wishlists", force: :cascade do |t|
    t.integer  "shop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "wishlists", ["customer_id"], name: "index_wishlists_on_customer_id"

end
