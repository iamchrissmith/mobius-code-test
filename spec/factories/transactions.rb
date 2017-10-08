FactoryGirl.define do
  factory :transaction do
    amount 1
    user
    to { create(:user) }
  end
end
