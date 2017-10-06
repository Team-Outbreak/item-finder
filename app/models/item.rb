class Item < ApplicationRecord
  has_many :associations, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 5 }

  def self.search(query)
    # Find and return the first matching item.
    # ILIKE is used in Postgres to ignore case
    # Additional matches are ignored for now
    where("name ILIKE ?", "%#{query.strip}%").first
  end
end
