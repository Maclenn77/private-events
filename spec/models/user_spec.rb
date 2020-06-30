require 'rails_helper'

RSpec.describe User do
  context 'after creating a User' do
    user = User.new

    it 'should be invalid without parameters' do
      expect(user).to_not be_valid
    end
  end
end
