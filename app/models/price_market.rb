# frozen_string_literal: true

class PriceMarket
  def initialize(market, item)
    @market = market
    @item = item
  end
  attr_reader :market, :item

  def price
    item.prices.find{ |price| price.market == market }&.value || 0
  end
end
