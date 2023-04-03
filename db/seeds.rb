puts "======== Dropping DB ========="
puts "=============================="

User.destroy_all
puts "======= Users destroyed ======"

puts "====== Creating Users ========"
admin = User.new(email: "admin@admin.com", first_name: "admin", last_name:"admin", phone_number: "000000000", password: 111111, password_confirmation: 111111, role: "admin")
admin.save!
puts "====== Admin created ========="
9.times do 
  user = User.new(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(digits: 9),
    password: 111111,
    role: "user"
  )
  user.save!
end
puts "====== Users created ========="