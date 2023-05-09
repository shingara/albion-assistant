class Craft < ApplicationRecord

  belongs_to :item
  has_many :craft_items

  ## Use by ActiveAdmin
  accepts_nested_attributes_for :craft_items, :allow_destroy => true

  validates :item, uniqueness: true

  def craft_prices
    Market.all.map do |market|
      CraftPrice.new(market, self)
    end
  end

end
