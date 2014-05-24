class OrdersController < ApplicationController
  layout "store"
  def my_orders
    @orders = current_user.orders
  end

end
