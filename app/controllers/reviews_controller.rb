class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.all
  end

private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
