class ReviewsController < ApplicationController

  def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to '/reviews'
  end

  def index
    @reviews = Review.all
  end

private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
