class ShopUser < ApplicationRecord
  before_action :authenticate_shopuser!


  validates :phone_number, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :user_addresses, dependent: :delete_all
  has_many :addresses, through: :user_addresses

  has_many :shopping_carts, dependent: :delete_all
  has_many :shopping_cart_items, through: :shopping_carts
  has_many :user_reviews, dependent: :delete_all
  has_many :order_lines, through: :user_reviews
  has_many :shop_orders, dependent: :delete_all
  has_many :user_payment_methods, dependent: :delete_all

  has_secure_password

  accepts_nested_attributes_for :addresses, allow_destroy: true
  def address_list
    addresses.map {|a| "#{a.unit_number}, #{a.street}, #{a.city}, #{a.province}, #{a.country}"}.join(", ").html_safe
    # addresses.map(&:full_address).join('<br>').html_safe
  end
end
