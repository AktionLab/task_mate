# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    alias_name "AliasName"
    sequence(:email) {|n| "email-#{n}@example.com"}
    password "password"
    password_confirmation {|user| user.password}
  end
end
