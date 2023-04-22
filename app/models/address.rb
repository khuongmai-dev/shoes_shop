class Address < ApplicationRecord
  validates :postal_code, :city, presence: true

  has_many :user_addresses, dependent: :delete_all
  has_many :shop_users, through: :user_addresses
end
