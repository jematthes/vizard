# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    title "MyText"
    description "MyText"
  
    factory :invalid_solution do
      title ""
    end

    factory :edit_solution do
      title "Policy Solution Title"
    end
  end
end
