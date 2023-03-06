FactoryBot.define do
  factory :user_address do
    name { "MyString" }
    address { "MyText" }
    complement { "MyString" }
    main { false }
  end
end
