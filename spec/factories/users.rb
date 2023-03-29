FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name   }
    last_name { Faker::Name.last_name  }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(digits: 9) }
    password { Faker::Internet.password }
    role { :user }


    trait :admin do
      role { :admin }
    end
  end
end
