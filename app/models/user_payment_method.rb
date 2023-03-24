class UserPaymentMethod < ApplicationRecord
  validates :shop_user_id, :payment_type_id, :provider, :account_number, :expriry_date, presence: true

  belongs_to :shop_user
  belongs_to :payment_type

  has_many :shop_orders, dependent: :destroy
end
