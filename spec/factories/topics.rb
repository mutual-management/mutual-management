FactoryBot.define do
  factory :topic do
   content  {"yano"}
   month    { Date.today }
   association :user
  end
end
