class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params,)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
