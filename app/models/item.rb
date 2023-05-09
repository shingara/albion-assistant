class Item < ApplicationRecord

  has_many :prices
  accepts_nested_attributes_for :prices, :allow_destroy => true

  # How you can craft this item
  has_one :craft
  accepts_nested_attributes_for :craft, :allow_destroy => true

  # Item can be craft with this item
  has_many :craft_items, class_name: 'CraftItem'

  validates :name, uniqueness: true

  def to_s
    global_name
  end

  def global_name
    "#{name}-T#{tier}"
  end

  def price_market(market)
    PriceMarket.new(market, self).price
  end
end
