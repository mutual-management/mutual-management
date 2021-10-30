FactoryBot.define do
  factory :daily_stack do
    title { "MyString" }
    amount { 1 }
    status { 1 }
    date { "2021-10-28" }
    unit { 1 }
    expense_category { nil }
    user { nil }
  end
end
