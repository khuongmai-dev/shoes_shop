class Promotion < ApplicationRecord
  validates :name, :discount_rate, presence: true

  has_many :category_promotions, dependent: :delete_all
  has_many :categories, through: :category_promotions
end
