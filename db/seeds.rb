@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
puts "1 user created"   

10.times do |post|
  Event.create!(title: "Valor event", date: Date.today, photo: "valor-logo.jpg", user_id: @user.id)
end
puts "10 Events have been created"
