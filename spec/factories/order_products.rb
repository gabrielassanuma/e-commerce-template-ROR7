FactoryBot.define do
  factory :order_product do
    association :product
    association :order
    quantity { Faker::Number.number(digits: 1) }
    association :cart
  end
end
