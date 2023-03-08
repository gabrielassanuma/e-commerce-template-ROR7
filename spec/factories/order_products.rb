FactoryBot.define do
  factory :order_product do
    product { nil }
    order { nil }
    quantity { 1 }
    cart { nil }
  end
end
