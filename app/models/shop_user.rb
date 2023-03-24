class ShopUser < ApplicationRecord
  validates :email_address, :phone_number, :password, presence: true

  has_many :user_addresses, dependent: :delete_all
  has_many :addresses, through: :user_addresses
  has_many :shopping_carts, dependent: :delete_all
  has_many :shopping_cart_items, through: :shopping_carts
  has_many :user_reviews, dependent: :delete_all
  has_many :order_lines, through: :user_reviews
  has_many :shop_orders, :user_payment_methods, dependent: :delete_all
end
