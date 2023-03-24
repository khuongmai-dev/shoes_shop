class ShopOrder < ApplicationRecord
  belongs_to :user_payment_method
  belongs_to :address
  belongs_to :shipping_method
  belongs_to :tax_rate
  belongs_to :order_status
end
