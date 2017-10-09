class Transaction < ApplicationRecord
  validates_presence_of  :user, :to, :amount
  validate :balance_cannot_be_less_than_zero, on: :create, if: :user_id

  belongs_to :user
  belongs_to :to, polymorphic: true

  def balance_cannot_be_less_than_zero
    user = User.find(user_id)
    if user.balance < amount.to_i
      errors.add(:amount, 'Amount cannot be more than your balance')
    end
  end
end
