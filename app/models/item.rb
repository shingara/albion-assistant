class Item < ApplicationRecord

  has_many :prices

  validates :name, uniqueness: true
end
