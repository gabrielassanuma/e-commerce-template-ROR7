FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    association :category 
    association :discount
    active { true }

    trait :invalid do
      name { "" }
      description { "" } 
    end
  end
end
