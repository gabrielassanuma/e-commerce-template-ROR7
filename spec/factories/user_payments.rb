FactoryBot.define do
  factory :user_payment do
    association :user
    card_name { Faker::Name.name }
    card_number { Faker::Number.number(digits: 16) }
    card_expiration { Faker::Number.number(digits: 4) }
  end
end
