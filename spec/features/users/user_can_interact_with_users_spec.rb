require 'rails_helper'

RSpec.feature 'User can interact with other Users' do
  context 'when not logged in' do
    it 'user should be redirected to the login page' do
      visit users_path

      expect(current_path).to eq login_path
    end 
  end

  context 'when logged in' do
    before { create_list(:user, 2) }

    it 'user can see all users in the system' do
      current_user = create(:user)
      user1 = User.first
      user2 = User.last

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit users_path

      expect(current_path).to eq users_path

      expect(page).to have_content "Your Credits: 100"
      expect(page).to have_content "#{user1.email}"
      expect(page).to have_content "#{user2.email}"
    end

    xit 'user can send credit to another user' do
    end
  end
end