class ShopOrder < ApplicationRecord
  validates :shop_user_id, :order_date, :user_payment_method_id, :address_id, :shipping_method_id, :tax_rate_id, :order_status_id

  belongs_to :user_payment_method
  belongs_to :address
  belongs_to :shipping_method
  belongs_to :tax_rate
  belongs_to :order_status

  has_many :order_lines, dependent: :destroy
  has_many :product_items, through: :order_lines
end
