puts "======== Dropping DB ========="
puts "=============================="

UserAddress.destroy_all
puts "== User's adresses destroyed =="
UserPayment.destroy_all
puts "== User's payment destroyed ==="
User.destroy_all
puts "======= Users destroyed ======"


puts "====== Creating Users ========"
admin = User.new(email: "admin@admin.com", first_name: "admin", last_name:"admin", phone_number: "000000000", password: 111111, password_confirmation: 111111, role: "admin")
admin.save!
puts "====== Admin created ========="
users = []
10.times do 
  user = User.new(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    phone_number: Faker::Number.number(digits: 9),
    password: 111111,
    role: "user"
  )
  user.save!
  users << user 
end
puts "====== Users created ========="

puts "=== Creating User's address ==="
users.each do | user |
  user_address = UserAddress.new(
    name: ["home", "job", "school"].sample,
    address: Faker::Address.full_address,
    complement: ["", "", "backyard", ""].sample,
    user: user,
    main: true
  )
  user_address.save!
end 
puts "=== User's address created ===="

puts "== Creating User's payments ==="
users.each do | user |
  2.times do 
    user_payments = UserPayment.new(
      user: user,
      card_name: "#{user.first_name} #{user.last_name}",
      card_number: Faker::Finance.credit_card(:mastercard),
      card_expiration: "#{rand(1..12).to_s.rjust(2, '0')}#{rand(23..32)}"
    )
    user_payments.save!
  end
end
puts "=== User's payment created ===="

puts ""