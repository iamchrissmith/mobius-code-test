require 'rails_helper'

RSpec.describe "User logs out" do
  it "they can logout" do
    user = create(:user)

    visit login_path

    within("form") do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Login"
    end

    click_on "Logout"

    expect(page).to have_content("Successfully logged out!")
    expect(page).to have_content("Login")
  end
end
