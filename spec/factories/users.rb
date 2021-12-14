FactoryBot.define do
  factory :user do
   name   { "yano" }
   email    { "yano@gmail.com" }
   password   { "yanoyano" }
   password_confirmation  { "yanoyano" }
  end
end
