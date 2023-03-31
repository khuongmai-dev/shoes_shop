class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  has_many :orderlines, class_name: 'OrderLine', dependent: :destroy

  has_one_attached :image

end
