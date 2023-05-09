class CraftItem < ApplicationRecord
  belongs_to :craft
  belongs_to :item

  validates :craft, uniqueness: { scope: :item }

  # quantity
end
