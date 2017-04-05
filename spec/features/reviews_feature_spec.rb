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
  
    Restaurant.create(name: 'Tayyabs', description: 'Has food.')
    visit '/restaurants'
    click_link 'Tayyabs'
  
    expect(page).to have_content('Very good.')
  end

  scenario "has a button to create a review" do
    Restaurant.create(name: 'Tayyabs', description: 'Has food.')
    visit '/restaurants'
    click_link 'Tayyabs'
    expect(page).to have_link('Add a review')
  end

  feature "add a review" do
    scenario "user adds a review using a form" do
      Restaurant.create(name: 'Tayyabs', description: 'Has food.')
      visit '/restaurants'
      click_link 'Tayyabs'
      click_link 'Add a review'
      fill_in 'review_rating', with: '5'
      fill_in 'review_comment', with: 'very tasty'
      click_button 'Submit'
      expect(current_path).to eq('/restaurants/1')
      expect(page).to have_content('very tasty' && '5')
    end
  end

  # feature 'reviewing' do
  #   before { Restaurant.create name: 'KFC' }
  #
  #   scenario 'allows users to leave a review using a form' do
  #      visit '/restaurants'
  #      click_link 'Review KFC'
  #      fill_in "Thoughts", with: "so so"
  #      select '3', from: 'Rating'
  #      click_button 'Leave Review'
  #
  #      expect(current_path).to eq '/restaurants'
  #      expect(page).to have_content('so so')
  #   end
  # end
end
