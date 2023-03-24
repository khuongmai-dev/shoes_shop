class TaxRate < ApplicationRecord
  validates :rate, presence: true

  has_many :shop_orders, dependent: :destroy
end
