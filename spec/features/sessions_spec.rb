require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:user) { create(:random_user) }

  context 'create a new session' do
    scenario 'can\'t login due to blank name' do
      visit login_path
      within('form') do
        fill_in 'Name', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Name cannot be blank')
    end

    scenario 'can\'t login due to invalid name' do
      visit login_path
      within('form') do
        fill_in 'Name', with: 'user'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid name')
    end

    scenario 'log out' do
      visit login_path
      within('form') do
        fill_in 'Name', with: user.name
      end
      click_button 'Log in'
      click_link 'Log Out'
      expect(page).to_not have_content('Hello')
    end
  end
end
