require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context "create new user" do
    scenario "should be successful" do
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: 'Username'
      end
      click_button 'Create User'
      expect(page).to have_content('Hello, Username')
    end

    scenario "should fail" do
      User.create(name: 'Username')
      visit sign_up_path
      within('form') do
        fill_in 'Add an username', with: 'Username'
      end
      click_button 'Create User'
      expect(page).to have_content('Name has already been taken')
    end
  end
end
