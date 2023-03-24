class ShippingMethod < ApplicationRecord
  validates :name, :price, presence: true

  has_many :shop_orders, dependent: :destroy
end
