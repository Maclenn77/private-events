require 'rails_helper'

RSpec.describe Event do
  context 'after creating an event' do
    event = Event.new

    it 'should be invalid without parameters' do
      expect(event).to_not be_valid
    end
  end

  context 'scope tests' do
    let!(:user) { create(:random_user) }
    let(:future_events) { create_list(:random_event, 3, date: '3000-06-30') }
    it 'a future event shouldn\'t be present in previous events list' do
      previous_events = Event.previous
      expect(previous_events).to_not include(future_events.last)
    end
  end
end
