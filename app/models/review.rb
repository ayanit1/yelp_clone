class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user

  validates :rating, presence: true
  # validates :user_id, presence: true

end
