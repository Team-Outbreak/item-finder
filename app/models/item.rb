class Item < ApplicationRecord
  has_many :associations, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 5 }
end
