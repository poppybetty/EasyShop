class AdminOrdersController < ApplicationController
  
  def manage_orders
    @orders = Order.find(:all)
  end
  
  def order_details        
    @order = Order.find(params[:id])
    # Get our items from orders.
    @items = @order.line_items
  end
  
  def process_order        
    @order = Order.find(params[:id])
    # Get our items from orders.
    @items = @order.line_items
  end
  
    def complete_process_order        
    @order = Order.find(params[:id])
    
    @order.order_status = params[:order_status]
    if @order.save
      flash[:notice] = "Order Updated successful."
    else
      flash[:error] = "Could not update Order, please try again"
    end
    
    
    redirect_to :action => :manage_orders
  end  
end
