class ReviewsController < ApplicationController

	before_filter :load_product
	#so that there's always a product loaded
	before_filter :ensure_logged_in, :only => [:show, :create, :show, :update, :destroy]
	#only ensure logged in for the methods in the hash.


  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.new(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to product_path(@product), notice: 'Review created!'
  	else
      render :show
  	end

  end

  def destroy
  	@review = @product.reviews.find(params[:id])
  	@review.destroy
  	redirect_to product_path(@product)
  end

  def edit
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id, :review_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end

end

# @review = @product.reviews.build(review_params)
# @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
