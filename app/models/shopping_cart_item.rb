class ShoppingCartItem < ApplicationRecord
  validates :shopping_cart_id, :product_item_id, presence: true

  belongs_to :product_item

  has_many :shopping_carts, dependent: :destroy
  has_many :shop_users, through: :shopping_carts
end
