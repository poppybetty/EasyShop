class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :unit_price, :order_id, :status, :product_id
  belongs_to :product
  belongs_to :order

  # Create a line item for the product.
  def self.for_product(product)
    item = self.new
    item.quantity = 1
    item.product = product
    item.unit_price = product.price
    item
  end
end
