# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :policy_problem do
    title "MyText"
    description "MyText"

    factory :invalid_policy_problem do
      title ""
    end

    factory :edit_policy_problem do
      title "Policy Problem Title"
    end
  end
end
