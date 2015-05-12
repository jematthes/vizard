# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    name "MyString"
    description "MyText"
    actor_type "MyString"
    support 1
    influence 1
  end
end
