FactoryBot.define do
  factory :monthly_target do
    title { "MyString" }
    amount { 1 }
    month { "2021-11-03" }
    unit { 1 }
    user { nil }
  end
end
