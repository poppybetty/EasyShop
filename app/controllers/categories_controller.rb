class CategoriesController < ApplicationController
  
  def index
    redirect_to :action => :list
  end
  
  # List all categories on the database.
  def list
    @categories = Category.find(:all)
  end
  
  # Render form to create new category
  def new
    @category = Category.new
  end
  
  # Process the creation of new category
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice]= "Category created successful"
      redirect_to :action => :list

    else  
      render :action => :new
    end
    
  end
  
  # Render form to update Category
  def edit
    @category = Category.find(params[:id])
  end
  
  # Process the updating of a category.
  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category updated successful."
      redirect_to :action => :list
    else
      render :action => :edit
    end
  end
  
  # Permanent remove the category
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:noice] = "Category deleted successful."
    else
      flash[:error] = "Could not delete category, plrease try again!"
    end
    
    redirect_to :action => :list
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
