class PaymentType < ApplicationRecord
  validates :value, presence: true

  has_many :user_payment_methods, dependent: :destroy
end
