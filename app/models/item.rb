class Item < ApplicationRecord

  has_many :prices

  # How you can craft this item
  has_one :craft

  # Item can be craft with this item
  has_many :craft_items

  validates :name, uniqueness: true
end
