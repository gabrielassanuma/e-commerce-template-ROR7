FactoryBot.define do
  factory :discount do
    name { sale }
    discount { Faker::Number.between(from: 0.0, to: 15.0)}
  end
end
