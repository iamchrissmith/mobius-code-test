require 'rails_helper'

describe 'Users API' do
  context 'GET /api/v1/users/current' do
    it 'returns logged in user email and credits' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/users/current'

      expect(response).to be_success

      current = JSON.parse(response.body)

      expect(current["email"]).to eq user.email
      expect(current["num_credits"]).to eq user.balance
    end
  end
end