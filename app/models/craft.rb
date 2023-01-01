class Craft < ApplicationRecord

  belongs_to :item
  has_many :craft_items

  validate :item, uniqueness: true

end
