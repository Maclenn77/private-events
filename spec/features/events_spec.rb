require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  context 'create new event' do
    let!(:user) { create(:random_user) }
    scenario 'should be successful' do
      login_user(user)
      visit create_event_path
      within('form') do
        fill_in 'Location', with: 'Heaven'
        fill_in 'Description', with: 'Take the stairway'
        select '2021', from: 'Date'
      end
      click_button 'Create event'
      expect(page).to have_content('Event in Heaven')
    end

    scenario 'should fail if not login' do
      visit create_event_path
      expect(page).to_not have_content('Create an event')
    end
  end

  context 'show an event' do
    let!(:user) { create(:random_user) }
    let(:event) { create(:random_event) }

    scenario 'show event info' do
      login_user(user)
      visit event_show_path(event.id)
      expect(page).to have_content('Creator')
    end
  end

  
end
