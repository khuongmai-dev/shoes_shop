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

ActiveRecord::Schema[7.0].define(version: 2023_03_24_135657) do
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

  create_table "addresses", force: :cascade do |t|
    t.integer "unit_number"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_addresses_on_province_id"
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

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "product_item_id", null: false
    t.bigint "shop_order_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_item_id"], name: "index_order_lines_on_product_item_id"
    t.index ["shop_order_id"], name: "index_order_lines_on_shop_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_item_variation_options", force: :cascade do |t|
    t.bigint "product_item_id", null: false
    t.bigint "variation_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_item_id"], name: "index_product_item_variation_options_on_product_item_id"
    t.index ["variation_option_id"], name: "index_product_item_variation_options_on_variation_option_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "SKU"
    t.integer "stock_quantity"
    t.string "product_image"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.text "description"
    t.bigint "brand_id", null: false
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

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_provinces_on_country_id"
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_orders", force: :cascade do |t|
    t.integer "shop_user"
    t.datetime "order_date"
    t.bigint "user_payment_method_id", null: false
    t.bigint "address_id", null: false
    t.bigint "shipping_method_id", null: false
    t.bigint "tax_rate_id", null: false
    t.decimal "order_total"
    t.bigint "order_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_shop_orders_on_address_id"
    t.index ["order_status_id"], name: "index_shop_orders_on_order_status_id"
    t.index ["shipping_method_id"], name: "index_shop_orders_on_shipping_method_id"
    t.index ["tax_rate_id"], name: "index_shop_orders_on_tax_rate_id"
    t.index ["user_payment_method_id"], name: "index_shop_orders_on_user_payment_method_id"
  end

  create_table "shop_users", force: :cascade do |t|
    t.string "email_address"
    t.integer "phone_number"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.bigint "product_item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_item_id"], name: "index_shopping_cart_items_on_product_item_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "shopping_cart_item_id", null: false
    t.bigint "shop_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_user_id"], name: "index_shopping_carts_on_shop_user_id"
    t.index ["shopping_cart_item_id"], name: "index_shopping_carts_on_shopping_cart_item_id"
  end

  create_table "tax_rates", force: :cascade do |t|
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "user_payment_methods", force: :cascade do |t|
    t.bigint "shop_user_id", null: false
    t.bigint "payment_type_id", null: false
    t.string "provider"
    t.integer "account_number"
    t.date "expriry_date"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_type_id"], name: "index_user_payment_methods_on_payment_type_id"
    t.index ["shop_user_id"], name: "index_user_payment_methods_on_shop_user_id"
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

  create_table "variation_options", force: :cascade do |t|
    t.bigint "variation_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variation_id"], name: "index_variation_options_on_variation_id"
  end

  create_table "variations", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_variations_on_category_id"
  end

  add_foreign_key "addresses", "provinces"
  add_foreign_key "category_promotions", "categories"
  add_foreign_key "category_promotions", "promotions"
  add_foreign_key "order_lines", "product_items"
  add_foreign_key "order_lines", "shop_orders"
  add_foreign_key "product_item_variation_options", "product_items"
  add_foreign_key "product_item_variation_options", "variation_options"
  add_foreign_key "product_items", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "provinces", "countries"
  add_foreign_key "shop_orders", "addresses"
  add_foreign_key "shop_orders", "order_statuses"
  add_foreign_key "shop_orders", "shipping_methods"
  add_foreign_key "shop_orders", "tax_rates"
  add_foreign_key "shop_orders", "user_payment_methods"
  add_foreign_key "shopping_cart_items", "product_items"
  add_foreign_key "shopping_carts", "shop_users"
  add_foreign_key "shopping_carts", "shopping_cart_items"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "shop_users"
  add_foreign_key "user_payment_methods", "payment_types"
  add_foreign_key "user_payment_methods", "shop_users"
  add_foreign_key "user_reviews", "order_lines"
  add_foreign_key "user_reviews", "shop_users"
  add_foreign_key "variation_options", "variations"
  add_foreign_key "variations", "categories"
end
