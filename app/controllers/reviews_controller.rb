class ReviewsController < ApplicationController
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

end
