class UserReview < ApplicationRecord
  belongs_to :shop_user
  belongs_to :order_line
end
