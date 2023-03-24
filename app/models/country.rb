class Country < ApplicationRecord
  validates :name, presence: true

  has_many :provinces, dependent: :delete_all
end
