class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      flash[:notice] = "Whoops something went wrong!"
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
      flash[:notice] = "Review successfully updated!"
    else
      flash[:notice] = "Whoops something went wrong!"
      render :edit
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to product_path(@review.product)
    end

  end



  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

end
