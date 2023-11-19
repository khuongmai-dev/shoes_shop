class UserAddress < ApplicationRecord
  belongs_to :shop_user
  belongs_to :address

  # validates :shop_user_id, :address_id, presence: true
end
