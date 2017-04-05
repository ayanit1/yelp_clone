class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: { message: "must be given" }


  def calculate_rating
    ratings = self.reviews.map { |review|
      review.rating
    }
    ratings.reduce(:+).to_f/ratings.length
  end
end
