class Item < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 5 }
end
