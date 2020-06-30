require 'rails_helper'
RSpec.describe User do
  context 'after creating a User' do
    it 'name should be unique' do
      @user = User.create(name: 'Tester')
      test_user = User.create(name: 'Tester')
      test_user.valid?
      assert test_user.errors
      assert test_user.errors[:name]
    end
  end
end
