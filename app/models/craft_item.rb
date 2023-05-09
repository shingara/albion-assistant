class CraftItem < ApplicationRecord
  belongs_to :craft
  belongs_to :item

  validates :craft, uniqueness: { scope: :item }

  def price_market(market)
    item.price_market(market) * quantity
  end

  # quantity
end
