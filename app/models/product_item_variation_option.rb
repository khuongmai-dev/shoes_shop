class ProductItemVariationOption < ApplicationRecord
  belongs_to :product_item
  belongs_to :variation_option
end
