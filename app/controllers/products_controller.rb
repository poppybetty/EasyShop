class ProductsController < ApplicationController

  def index
    redirect_to :action => :admin_list
  end
  # Admin- List all products
  def admin_list
    @products = Product.find(:all)
  end
  
  # Render Product form
  def new
    @product = Product.new
    @categories = Category.find(:all)
    if @categories.empty?
      flash[:error] = "Please add category first!"
      redirect_to :controller => :categories,  :action => :new
    end
  end
  
  # Create product
  def create
    @product = Product.new(params[:product])
    
    if @product.save
      flash[:notice] = "Product created successful."
      redirect_to :action => :admin_list
    else
      @categories = Category.find(:all)
      render :action => :new
    end
  end
  
  # Reder page to edit product
  def edit
    @product = Product.find(params[:id])
    @categories = Category.find(:all)
  end
  
  # Process the update of product
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product updated successuly."
      redirect_to :action => :admin_list
    else
      @categories = Category.find(:all)
      render :action => :edit
    end    
  end
  
  def destroy
     @product = Product.find(params[:id])
     if @product.destroy
       flash[:notice] = "Product #{@product.name} deleted successfuly."
     else
       flash[:error] = "Could not delete Product, please try again!"
     end
       redirect_to :action => :admin_list
  end  
end
