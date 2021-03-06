class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.user_id = current_user.id
    p @restaurant
    @restaurant.save
    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @avg_rating = @restaurant.calculate_rating
    @reviews = Review.where(restaurant_id: params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :image)
  end
end
