FactoryBot.define do
  factory :user_address do
    name { Faker::Name.suffix  }
    address { Faker::Address.full_address }
    complement { Faker::Number.number(digits: 4) }
    main { true }
    association :user
  end
end
