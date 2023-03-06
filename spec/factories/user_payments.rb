FactoryBot.define do
  factory :user_payment do
    user { nil }
    card_name { "MyString" }
    card_number { "MyString" }
    card_expiration { "MyString" }
  end
end
