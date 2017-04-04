require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Review do
  let(:review){described_class.new}

  it "tests database" do
  expect{review.create(rating: 5, comment: "Very good")}.to change(Review, :count)
  end
  
end
