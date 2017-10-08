require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:to) }
      it { should validate_presence_of(:amount) }
    end

    context 'valid attributes' do
      it 'is valid with user, to and amount' do
        transaction = create(:transaction)

        expect(transaction).to be_valid
      end
    end
  end
end
