class UserAddress < ApplicationRecord
  belongs_to :shop_user
  belongs_to :address
end
