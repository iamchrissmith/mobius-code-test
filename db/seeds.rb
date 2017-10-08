User.destroy_all

5.times do |num|
  User.create!(
    email: "user-#{num}@email.com",
    password: 'user'
  )
end