class CraftItem < ApplicationRecord
  belongs_to :craft
  belongs_to :item

  validate :craft, uniqueness: { scope: item }
end
