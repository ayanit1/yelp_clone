require 'rails_helper'

describe Restaurant do

  before :each do
    @restaurant = Restaurant.create(name: 'KFC', description: 'Fried Chicken')
  end

  describe 'average rating' do
    it 'responds to calculate_rating' do
      expect(@restaurant).to respond_to(:calculate_rating)
    end

    it 'calculates the average rating for the restaurant' do
      Review.create(rating: 5, restaurant_id: 1)
      Review.create(rating: 4, restaurant_id: 1)
      expect(@restaurant.calculate_rating).to eq(4.5)
    end
  end

end
