# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ask do
    title "MyText"
    description "MyText"

    factory :invalid_ask do
      title ""
    end

    factory :edit_ask do
      title "Ask Title"
    end
  end
end
