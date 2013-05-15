FactoryGirl.define do
  factory :user do
    name "Jane Doe"
    phone "2065555555"
    sequence(:email) { |n| "user#{n}@pestr.com" }
    password "password"
    password_confirmation "password"

    factory :confirmed_user do
      after_create do |user|
        user.confirm!
      end
    end
  end
end
