# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    assignable { Factory(:user) }
    task { Factory(:task) }
  end
end

