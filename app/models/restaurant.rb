class Restaurant < ActiveRecord::Base
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy
  validates :name, presence: { message: "must be given" }
=======
  attr_reader :ratings
>>>>>>> f917c83b366ffd316fa131320489e55e238fe9f7

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
