class Transaction < ApplicationRecord
  validates_presence_of  :user, :to, :amount

  belongs_to :user
  belongs_to :to, polymorphic: true
end
