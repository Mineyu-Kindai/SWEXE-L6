class Product < ApplicationRecord
  has_many :cartitems
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: 
    { only_integer: true, greater_than_or_equal_to: 0, 
      less_than_or_equal_to: 10000000 }
end
