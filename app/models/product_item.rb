class ProductItem < ApplicationRecord
  validates :price, :stock_quantity, presence: true
  belongs_to :product

  has_many :shopping_cart_items, dependent: :destroy

  has_many :product_item_variation_options, dependent: :destroy
  has_many :variation_options, through: :product_item_variation_options

  has_many :order_lines, dependent: :destroy
  has_many :shop_orders, through: :order_lines
end
