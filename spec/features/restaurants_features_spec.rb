require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Homeslice')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Homeslice')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Homeslice'
      fill_in 'Description', with: 'Pizza Place'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Homeslice'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:kfc){ Restaurant.create(name:'KFC', description: 'Deep fried goodness') }

    scenario 'lets a user view a restaurant' do
     visit '/restaurants'
     click_link 'KFC'
     expect(page).to have_content 'KFC'
     expect(page).to have_content 'Deep fried goodness'
     expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do

    before { Restaurant.create name: 'KFC', description: 'Deep fried goodness', id: 1 }

    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'Deep fried goodness'
      click_button 'Update Restaurant'
      click_link 'Kentucky Fried Chicken'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Deep fried goodness'
      expect(current_path).to eq '/restaurants/1'
    end
  end

  context 'deleting restaurants' do

  before { Restaurant.create name: 'KFC', description: 'Deep fried goodness' }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

  context 'viewing restaurant rating' do

  before { Restaurant.create name: 'KFC', description: 'Deep fried goodness' }

    scenario 'shows the average rating on the restaurant landing page' do
      visit '/restaurants'
      click_link 'KFC'
      click_link 'Add a review'
      fill_in 'review_rating', with: '4'
      click_button 'Submit'
      click_link 'Add a review'
      fill_in 'review_rating', with: '5'
      click_button 'Submit'
      expect(page).to have_content '4.5'
    end
  end
end
