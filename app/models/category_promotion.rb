class CategoryPromotion < ApplicationRecord
  validates :promotion_id, :category_id, presence: true

  belongs_to :promotion
  belongs_to :category
end
