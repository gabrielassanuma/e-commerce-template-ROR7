FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    position { Faker::Number.between(from: 1, to: 10) }


    trait :invalid do
      name { "" }
      position { "" } 
    end
  end
end
