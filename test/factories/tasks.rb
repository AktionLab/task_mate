# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    subject "Task Subject"
    description "Task Description"
  end
end
