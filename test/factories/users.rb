# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    sequence(:alias_name) {|n| "AliasName#{n}" }
    sequence(:email) {|n| "email-#{n}@example.com"}
    password "password"
    password_confirmation {|user| user.password}
  end
end
