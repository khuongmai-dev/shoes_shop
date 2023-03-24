class Category < ApplicationRecord
  validates :name, presence: true

# Declare the self-referential relationship with parent and children categories
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  validates :name, uniqueness: { scope: :parent_id, case_sensitive: false }

  # Validate that parent category cannot be self
  validate :parent_cannot_be_self

  def parent_cannot_be_self
    if parent == self
      errors.add(:parent, "cannot be self")
    end
  end
end
