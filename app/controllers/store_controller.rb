class StoreController < ApplicationController
  
  def index
    redirect_to :action => :list
  end
  
  def list
    @categories = Category.find(:all)
    @category = @categories.first
    redirect_to :action => :products, :id => @category
  end
  
  def products
    if params[:id] && !params[:id].empty?
      @category = Category.find(params[:id])
    else
      flash[:error] = "No category loaded yet, please ask Admin to load categories and products."
    end
  end
  
  def search_products
    @search_string = params[:search_product]
    @products = Product.find(:all, :conditions => "lower(name) like '%#{params[:search_product].downcase}%'")
  end
  
  def product_details
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    product = Product.find(params[:id])      
    @cart = find_cart
    @items = @cart.add_product(product, params[:quantity])
  end

  def complete_order_successfully        
    @cart = find_cart
    @order = Order.new
    @order.customer = current_user
   
    @order.shipping_cost = @cart.shipping_cost.to_f
    @order.order_no = Order.generate_reference
    if @order.save!
      @order.items = @cart.items

      flash[:notice] = "Your order has been processed, Please download the invoice below as proof of purchase."
      session[:cart] = nil
    end
    #
    @order.reload

    # Get our items from orders.
    @items = @order.line_items
  end
  
  def order_details        
    @order = Order.find(params[:id])
    # Get our items from orders.
    @items = @order.line_items
  end
  

  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Cart has been empty successfully"
    redirect_to :action => :index
  end

  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end
       
  def my_profile
    @user = current_user
  end
  
  def update_my_profile
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated successful"
    else
      flash[:error] = "Could not update profile, plrease try again"
    end
    
    redirect_to :action => :list
  end
  
end
