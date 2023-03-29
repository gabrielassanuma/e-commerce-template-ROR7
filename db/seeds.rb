puts "======== Dropping DB ========="
puts "=============================="

User.destroy_all
puts "======= Users destroyed ======"

puts "====== Creating Users ========"

admin = User.new(email: "admin@admin.com", first_name: "admin", last_name:"admin", phone_number: "000000000", password: 111111, password_confirmation: 111111, role: "admin")
admin.save!