require 'rails_helper'

RSpec.describe User do

  context 'after creating a User' do
    let(:user) { create(:random_user) }

    it 'name should be unique' do
      test_user = user.dup
      test_user.valid?
      expect(test_user.errors[:name]).to eql(['has already been taken'])
    end

    it 'create a valid user' do
        user
        expect(user).to exist
    end
  end
end
