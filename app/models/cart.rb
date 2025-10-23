class Cart < ApplicationRecord
  has_many :cart_items
  
  def total_price
    cart_items.to_a.sum { |item| item.product.price * item.qty }
  end
end
