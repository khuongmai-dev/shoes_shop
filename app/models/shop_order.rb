class ShopOrder < ApplicationRecord
  validates :shop_user_id, presence: true

  belongs_to :address
  belongs_to :order_status
  belongs_to :shop_user

  has_many :order_lines, dependent: :destroy
  has_many :product_items, through: :order_lines
end
