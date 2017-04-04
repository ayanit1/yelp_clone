require 'rails_helper'
#looks like calling the .new method instantiates the database object already
#rather than calling create for the testing database test, just call save

describe Review do
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

  it "tests database" do
  expect{review.save(rating: 5, comment: "Very good")}.to change(Review, :count)
  end

end
