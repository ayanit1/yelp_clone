class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    review = @restaurant.reviews.build(review_params)
    review.user_id = current_user.id
    review.save
    redirect_to "/restaurants/#{@restaurant.id}"
  end

private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
