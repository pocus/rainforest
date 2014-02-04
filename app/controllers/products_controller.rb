class ProductsController < ApplicationController

  before_filter :ensure_logged_in, :only => [:show]
  #only ensure logged in for show.

  def index
  	@products = Product.all
  	#set class variable to all products array
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.new
    end

  	#set class variable to one product.
  end

  def new
  	@product = Product.new

  end

  def edit #retrieve edit form
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def update #save user edits
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end


end
