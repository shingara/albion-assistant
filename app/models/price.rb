class Price < ApplicationRecord
  belongs_to :market
  belongs_to :item

  validates :market, uniqueness: { scope: :item }

  def to_s
    "#{item.name} on #{market.name} => #{value}"
  end
end
