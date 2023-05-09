class Market < ApplicationRecord
  TAXE = 0.96

  has_many :prices
end
