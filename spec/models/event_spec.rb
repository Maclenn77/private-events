require 'rails_helper'

RSpec.describe Event do
  context 'after creating an event' do
    event = Event.new

    it 'should be invalid without parameters' do
      expect(event).to_not be_valid
    end
  end

  context 'scope tests' do
    let (:params) { { location: 'Hell', description: 'Take the Highway', creator_id: 1 } }

    it 'a future event shouldn\'t be present in previous events list' do
      User.new.save
      events_list = []
      3.times do
        e = Event.new(params.merge(date: Time.now))
        e.save
        events_list << e
      end
      event = Event.new(params.merge(date: '3000-06-30'))
      event.save
      previous_events = Event.previous
      expect(previous_events).to_not include(event)
    end
  end
end
