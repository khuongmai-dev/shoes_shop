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

ActiveRecord::Schema[7.0].define(version: 2023_04_28_162339) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "unit_number"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "province"
    t.string "country"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.string "brand_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.string "category_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_promotions", force: :cascade do |t|
    t.bigint "promotion_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_promotions_on_category_id"
    t.index ["promotion_id"], name: "index_category_promotions_on_promotion_id"
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "shop_order_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_order_lines_on_product_id"
    t.index ["shop_order_id"], name: "index_order_lines_on_shop_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.text "description"
    t.bigint "brand_id", null: false
    t.decimal "price"
    t.integer "stock_quantity"
    t.string "product_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "discount_rate"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_orders", force: :cascade do |t|
    t.integer "shop_user_id"
    t.datetime "order_date"
    t.bigint "address_id", null: false
    t.decimal "order_total"
    t.bigint "order_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_status"
    t.float "tax_rate"
    t.decimal "order_subtotal"
    t.index ["address_id"], name: "index_shop_orders_on_address_id"
    t.index ["order_status_id"], name: "index_shop_orders_on_order_status_id"
  end

  create_table "shop_users", force: :cascade do |t|
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_address", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email_address"], name: "index_shop_users_on_email_address"
    t.index ["reset_password_token"], name: "index_shop_users_on_reset_password_token", unique: true
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_cart_items_on_product_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "shopping_cart_item_id", null: false
    t.bigint "shop_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_user_id"], name: "index_shopping_carts_on_shop_user_id"
    t.index ["shopping_cart_item_id"], name: "index_shopping_carts_on_shopping_cart_item_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.boolean "is_default"
    t.bigint "shop_user_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_user_addresses_on_address_id"
    t.index ["shop_user_id"], name: "index_user_addresses_on_shop_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "shop_user_id", null: false
    t.bigint "order_line_id", null: false
    t.integer "rating_value"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_line_id"], name: "index_user_reviews_on_order_line_id"
    t.index ["shop_user_id"], name: "index_user_reviews_on_shop_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "category_promotions", "categories"
  add_foreign_key "category_promotions", "promotions"
  add_foreign_key "order_lines", "products"
  add_foreign_key "order_lines", "shop_orders"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "shop_orders", "addresses"
  add_foreign_key "shop_orders", "order_statuses"
  add_foreign_key "shopping_cart_items", "products"
  add_foreign_key "shopping_carts", "shop_users"
  add_foreign_key "shopping_carts", "shopping_cart_items"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "shop_users"
  add_foreign_key "user_reviews", "order_lines"
  add_foreign_key "user_reviews", "shop_users"
end
