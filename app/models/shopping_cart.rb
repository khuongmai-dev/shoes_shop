class ShoppingCart < ApplicationRecord
  validates :shopping_cart_item_id, :shop_user_id, presence: true

  belongs_to :shopping_cart_item
  belongs_to :shop_user
end
