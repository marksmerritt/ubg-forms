admin_user = User.new(
  first_name: "Admin",
  last_name: "User", 
  role: :admin,
  email: "admin@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

admin_user.skip_confirmation!
admin_user.save!

puts "1 Admin User Created"