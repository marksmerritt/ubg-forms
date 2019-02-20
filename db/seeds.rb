User.delete_all

employee_user = User.new(
  first_name: "Employee",
  last_name: "User", 
  role: :employee,
  email: "employee@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

employee_user.skip_confirmation!
employee_user.save!

puts "1 Employee User Created"

supervisor_user = User.new(
  first_name: "Supervisor",
  last_name: "User", 
  role: :supervisor,
  email: "supervisor@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

supervisor_user.skip_confirmation!
supervisor_user.save!

puts "1 Supervisor User Created"


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

