1.times do
  User.create(
      name: "yoshiyuki",
      email: "yoshiyuki@gmail.com",
      password: 'yoshiyuki',
      password_confirmation: 'yoshiyuki'
  )
end

10.times do
  Topic.create(
      content: "test",
      month: "2021-11-01",
      user_id: 1
  )
end
