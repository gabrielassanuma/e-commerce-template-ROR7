FactoryBot.define do
  factory :user do
    role { "user" }
    first_name { Faker::Name.first_name   }
    last_name { Faker::Name.last_name  }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(digits: 9) }
  end
end
