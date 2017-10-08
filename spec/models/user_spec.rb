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

    context "relationships" do
      it "has many transactions" do
        user = create(:user)

        expect(user).to respond_to(:transactions)
      end

      it 'has many receipts' do
        user = create(:user)

        expect(user).to respond_to(:receipts)
      end
    end

    describe ".balance" do
      it 'user has a balance' do
        user = create(:user)

        expect(user).to respond_to(:balance)
      end

      it 'user has an initial balance of 100' do
        user = create(:user)

        expect(user.balance).to eq 100
      end
    end
  end
end
