require 'rails_helper'

RSpec.feature 'User can interact with other Users' do
  context 'when not logged in' do
    it 'user should be redirected to the login page' do
      visit users_path

      expect(current_path).to eq login_path
    end 
  end

  context 'when logged in' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let(:current_user) { create(:user) }

    it 'user can see all users in the system' do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit users_path

      expect(current_path).to eq users_path

      expect(page).to have_content "Your Credits: 100"
      expect(page).to have_content "#{user1.email}"
      expect(page).to have_content "#{user2.email}"
      expect(page).to have_content "Send Credit to: "
    end

    it 'user can send credit to another user' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
      
      visit users_path

      within ".user-#{user1.id}" do
        fill_in 'Amount', with: '10'
        click_on "Send Credit"
      end

      expect(current_path).to eq users_path

      expect(current_user.balance).to eq 90
      expect(user1.balance).to eq 110
      expect(page).to have_content "Your Credits: 90"
    end
  end
end