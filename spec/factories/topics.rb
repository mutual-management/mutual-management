FactoryBot.define do
  factory :topic do
   content  {"yano"}
   month    { Date.today }
   user_id  { 1 }
   association :user
  end
end
