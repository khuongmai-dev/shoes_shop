class OrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :shop_order

end
