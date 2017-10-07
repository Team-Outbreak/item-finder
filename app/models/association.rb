class Association < ApplicationRecord
  belongs_to :item
  validates :name, presence: true, length: { minimum: 3 }
  validates :ranking, presence: true, :inclusion => 0...101
end
