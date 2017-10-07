require 'rails_helper'

RSpec.feature "Guest Can Create User Account" do
  context "when not logged in" do
    it 'guest should be able to enter their email and password' do
      visit root_path

      click_on "Create Account"

      expect(current_path).to eq new_user_path

      fill_in 'Email', with: 'email@email.com'

      fill_in "Password", with: "123abc"
      fill_in "Password confirmation", with: "123abc"

      click_on "Create User"

      user = User.last

      expect(current_path).to eq users_path
      expect(page).to have_content "Your Account has been created."
      
      expect(page).to have_content "Your Credits: 100"
      expect(page).to have_content "Logout"

      expect(user.email).to eq "email@email.com"
    end

    it 'guest should not be able to create account if email already used' do
      existing_user = create(:user)

      visit root_path
      
      click_on "Create Account"

      expect(current_path).to eq new_user_path

      fill_in 'Email', with: 'email@email.com'

      fill_in "Password", with: "123abc"
      fill_in "Password confirmation", with: "123abc"

      click_on "Create User"

      expect(page).to have_content "Email has already been taken"
    end

    it 'guest should not be able to create account if passwords do not match' do
      visit root_path
      
      click_on "Create Account"

      expect(current_path).to eq new_user_path

      fill_in 'Email', with: 'email@email.com'

      fill_in "Password", with: "123abc"
      fill_in "Password confirmation", with: "abc123"

      click_on "Create User"

      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'when already logged in' do
    xit 'user should not see the create account button' do
    end

    xit 'user should be redirected to users_path if manually visits new_user_path' do
    end
  end
end