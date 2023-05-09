# frozen_string_literal: true

class CraftPrice
  def initialize(market, craft)
    @market = market
    @craft = craft
  end
  attr_reader :market, :craft

  delegate :focalisation, to: :craft
  delegate :item, to: :craft

  def craft_price
    @craft_price ||= (
      craft.craft_items.sum do |craft_item|
        craft_item.price_market(market)
      end / focalisation.to_f
    ) + food_price
  end

  # TODO: Need to be calculate
  def food_price
    0
  end

  def sell_price
    craft_price / Market::TAXE
  end

  def benefice
    current_sell_price - craft_price
  end

  def current_sell_price
    @current_sell_price ||= item.price_market(market)
  end

end
