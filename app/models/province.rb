class Province < ApplicationRecord
  validates :name, presence: true

  belongs_to :country

  has_many :addresses, dependent: :delete_all
end
