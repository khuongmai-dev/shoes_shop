class Product < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :product_items, dependent: :destroy
  belongs_to :brand
end
