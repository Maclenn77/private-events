require 'rails_helper'

RSpec.describe Event do
  context 'after creating an event' do
    event = Event.new

    it 'should be invalid without parameters' do
      expect(event).to_not be_valid
    end
end
