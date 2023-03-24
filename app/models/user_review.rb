class UserReview < ApplicationRecord
  validates :shop_user_id, :order_line_id, :rating_value, presence: true

  belongs_to :shop_user
  belongs_to :order_line
end
