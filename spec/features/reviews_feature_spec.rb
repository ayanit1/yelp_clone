require 'rails_helper'

feature "displays views" do

  scenario "can show reviews from database" do
    Review.create(rating: 5, comment: "Very good.")
    visit '/reviews'
    expect(page).to have_content('Very good.')
  end

  scenario "has a button to create a review" do
    visit '/reviews'
    expect(page).to have_link('Add a review')
  end
end
