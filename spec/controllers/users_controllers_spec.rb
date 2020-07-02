require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'request list of all users' do
    let(:users_list) { create_list(:random_user, 10) }
    it 'should return a list of all users' do
      get index_path
      expect(response).to be_success
    end
  end
end
