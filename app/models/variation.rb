class Variation < ApplicationRecord
  validates :name, presence: true

  belongs_to :category

  has_many :variation_options, dependent: :destroy

end
