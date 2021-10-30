FactoryBot.define do
  factory :expense_category do
    title { "MyString" }
    delete_flag { false }
    user { nil }
  end
end
