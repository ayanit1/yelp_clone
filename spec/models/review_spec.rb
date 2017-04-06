require 'rails_helper'
#looks like calling the .new method instantiates the database object already
#rather than calling create for the testing database test, just call save

describe Review do

  it {should belong_to(:user)}
  it {should belong_to(:restaurant)}
  it {should validate_presence_of(:rating)}

  let(:review){described_class.new}

  it "responds to :id" do
    expect(review).to respond_to(:id)
  end

  it "responds to :rating" do
    expect(review).to respond_to(:rating)
  end

  it "responds to :comment" do
    expect(review).to respond_to(:comment)
  end

  it "responds to :user_id" do
    expect(review).to respond_to(:user_id)
  end

  it "tests database" do
    User.create(email: "test@testing.com", password: "password")
    expect{Review.create(rating: 5, comment: "Very good", user_id: 1)}.to change(Review, :count)
  end
end
