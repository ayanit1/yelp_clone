class Restaurant < ActiveRecord::Base
  attr_reader :ratings

  has_many :reviews, dependent: :destroy
  validates :name, presence: { message: "must be given"}
  # message doesn't show

  def calculate_rating
    get_ratings
    if !@ratings.empty?
      @ratings.reduce(:+).to_f/ratings.length
    end
  end

  private

  def get_ratings
    @ratings = self.reviews.map do |review|
      review.rating
    end
  end

end
