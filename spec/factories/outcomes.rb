# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outcome do
    title "MyText"
    description "MyText"

    factory :invalid_outcome do
      title ""
    end

    factory :edit_outcome do
      title "Outcome Title"
    end
  end
end
