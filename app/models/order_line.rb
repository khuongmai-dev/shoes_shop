class OrderLine < ApplicationRecord
  belongs_to :product_item
  belongs_to :shop_order
end
