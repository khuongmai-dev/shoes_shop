class Page < ApplicationRecord
  before_validation :generate_permalink

  def generate_permalink
    base_permalink = title.parameterize
    permalink_count = 0
    permalink = base_permalink

  # Loop until a unique permalink is found
  loop do
    if permalink_count > 0
      permalink = "#{base_permalink}-#{permalink_count}"
    end

    if Page.exists?(permalink: permalink)
      permalink_count += 1

    else
      self.permalink = permalink
      break
    end
    end
  end
  validates :title, :content, :permalink, presence: true
  validates :permalink, uniqueness: true
end
