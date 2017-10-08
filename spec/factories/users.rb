FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@email.com" }
    password "MyString"
  end
end
