class Restaurant < ActiveRecord::Base
  attr_reader :ratings

  has_many :reviews, dependent: :destroy

  validates :name, presence: { message: "must be given" }

  has_attached_file :image, :storage => :cloudinary, :path => ':id/:style/:filename', styles: { large: "600x600>", medium: "3003x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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
