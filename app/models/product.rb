class Product < ApplicationRecord
  validate :name, presence: true

  belongs_to :category, :brand
  has_many :product_items, dependent: :destroy
end
