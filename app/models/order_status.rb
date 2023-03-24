class OrderStatus < ApplicationRecord
  validates :status, presence: true

  has_many :shop_orders, dependent: :destroy
end
