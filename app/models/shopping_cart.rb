class ShoppingCart < ApplicationRecord
  belongs_to :shopping_cart_item
  belongs_to :shop_user
end
