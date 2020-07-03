require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create new user' do
    let(:user) { create(:random_user) }
    let(:events) { create_list(:random_event, 10) }

    scenario 'should be successful' do
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: 'Username'
      end
      click_button 'Create User'
      expect(page).to have_content('Hello, Username')
    end

    scenario 'should fail' do
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: user.name.to_s
      end
      click_button 'Create User'
      expect(page).to have_content('Name has already been taken')
    end

    scenario 'should not show the user profile if guest not logged in' do
      visit user_path(id: 1)
      expect(page).to have_content('Log In')
    end

    scenario 'should show the events created by the user' do
      login_user(user)
      click_link("Hello, #{user.name}")
      expect(page).to have_content('Created events')
    end
  end
end
