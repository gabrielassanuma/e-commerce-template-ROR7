FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    position { Faker::Number.between(from: 1, to: 10) }
  end
end
