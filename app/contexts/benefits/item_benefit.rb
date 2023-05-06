# frozen_string_literal: true

module Benefits
  class ItemBenefit
    def initialize(bags=[], market=Market.first)
      @bags = bags
      @market = market
    end
    attr_reader :bags, :market

    def calculate
      prices = {}
      bags.each do |bag|
        price = bag.item.prices.find_by(market_id: market.id)
        { item => (price * bag.quantity) }
        bag.item.craft_items.each do |craft_item|
        end
      end
    end
  end
end
