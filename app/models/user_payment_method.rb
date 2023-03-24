class UserPaymentMethod < ApplicationRecord
  belongs_to :shop_user
  belongs_to :payment_type
end
