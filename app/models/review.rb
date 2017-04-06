class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user

  validates :rating, presence: true
  # validates :user_id, presence: true

  def get_user_email
    user = User.find(self.user_id)
    user.email
  end

end
