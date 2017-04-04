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

feature "add a review" do
  scenario "user adds a review using a form" do
    visit '/reviews'
    click_link 'Add a review'
    fill_in 'review_rating', with: '5'
    fill_in 'review_comment', with: 'very tasty'
    click_button 'Submit'
    expect(page).to have_content('very tasty')
  end
end
end