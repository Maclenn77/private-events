require 'rails_helper'

RSpec.feature "Events", type: :feature do
  context "create new event" do
    scenario "should be successful" do
      user = User.create(name: 'Tester')
      visit login_path
      within('form') do
        fill_in 'Name', with: user.name
      end
      click_button 'Log in'
      visit create_event_path
      within('form') do
        fill_in 'Location', with: 'Heaven'
        fill_in 'Description', with: 'Take the stairway'
        select '2021', from: 'Date'
      end
      click_button 'Create event'
      expect(page).to have_content('Event in Heaven')
    end

    scenario "should fail if not login" do
      visit create_event_path
      expect(page).to_not have_content('Create an event')
    end
  end
end
