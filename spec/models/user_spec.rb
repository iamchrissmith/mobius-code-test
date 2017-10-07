require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context "invalid attributes" do
      it { should have_secure_password }
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
    end

    context "valid attributes" do
      it 'is valid with email and password' do
        user = create(:user)

        expect(user).to be_valid
      end
    end
  end
end
