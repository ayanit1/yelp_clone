require 'rails_helper'


feature "displays reviews" do
  scenario "has a button to create a review" do
    Restaurant.create(name: 'Tayyabs', description: 'Has food.')
    visit '/restaurants'
    click_link 'Tayyabs'
    expect(page).to have_link('Add a review')
  end

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
