class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :transactions
  has_many :receipts, :class_name => "Transaction", foreign_key: 'to'

  def balance 
    100 - credit_sent + credit_received
  end

  private

    def credit_sent
      transactions.sum(:amount)
    end

    def credit_received
      receipts.sum(:amount)
    end
end
