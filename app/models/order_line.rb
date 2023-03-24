class OrderLine < ApplicationRecord
  validates :quantity, :price, :shop_order_id, :product_item_id, presence: true

  belongs_to :product_item
  belongs_to :shop_order

  has_many :user_reviews, dependent: :destroy
end
