FactoryBot.define do
  factory :user do
   name   { "yano" }
   email    { "yano@gmail.com" }
   password   { "yanoyano" }
   password_confirmation  { "yanoyano" }
   id     { 1 }
  end
end
