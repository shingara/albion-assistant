class Item < ApplicationRecord

  has_many :prices

  # How you can craft this item
  has_one :craft

  # Item can be craft with this item
  has_many :craft_items, class_name: 'CraftItem'

  validates :name, uniqueness: true

  def to_s
    global_name
  end

  def global_name
    "#{name}-T#{tier}"
  end
end
