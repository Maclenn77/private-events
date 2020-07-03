require 'rails_helper'



RSpec.feature 'Users', type: :feature do

  context 'create new user' do
    let(:user) { create(:random_user) }

    scenario 'should be successful' do
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: 'Username'
      end
      click_button 'Create User'
      expect(page).to have_content('Hello, Username')
    end

    scenario 'should fail' do
      User.create(name: 'Username')
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: 'Username'
      end
      click_button 'Create User'
      expect(page).to have_content('Name has already been taken')
    end

    scenario 'should not show the user profile if guest not logged in' do
      @user = user
      visit user_path(id: 1)
      expect(page).to have_content('Log In')
    end

    scenario 'should show the user profile if guest is logged in' do
      # user = FactoryBot.create(:random_user)
      current_user = user
      visit user_path(id: 1)
      expect(page).to have_content('Log Out')
    end
  end
end
