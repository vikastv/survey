FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "user-email#{n}@example.com" }
    password "12345678"
    password_confirmation { |u| u.password }
  end
end