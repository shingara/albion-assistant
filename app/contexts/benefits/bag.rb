# frozen_string_literal: true

module Benefits
  class Bag
    def initialize(item, quantity)
      @item = item
      @quantity = quantity
    end
    attr_reader :item, :quantity
  end
end
