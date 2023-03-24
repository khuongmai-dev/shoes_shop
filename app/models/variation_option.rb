class VariationOption < ApplicationRecord
  validate :value, presence: true
  belongs_to :variation

  has_many :product_item_variation_options, dependent: :destroy
  has_many :product_item, through: :product_item_variation_options
end
