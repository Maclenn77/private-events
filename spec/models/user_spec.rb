require 'rails_helper'

RSpec.describe User do
  context 'after creating a User' do
    it 'name should be unique' do
      @user = User.create(name: 'Tester')
      test_user = User.create(name: 'Tester')
      test_user.valid?
      expect(test_user.errors[:name]).to eql(['has already been taken'])
    end
  end
end
