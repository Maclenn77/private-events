require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  describe Event do
    let(:event) { Event.new }
    describe '#check_victory' do
      it 'Should redirect to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
