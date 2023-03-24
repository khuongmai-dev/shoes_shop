class Address < ApplicationRecord
  validates :postal_code, :city, presence: true

  belongs_to :province

  has_many :user_addresses, dependent: :delete_all
  has_many :shop_users, through: :user_addresses
end
