FactoryBot.define do
  role_types = [:employee, :supervisor, :admin]
  
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user, class: User do
    first_name { "Employee" }
    last_name { "User" }
    role { role_types.sample }
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    confirmed_at { Date.yesterday }
  end

  factory :employee_user, class: User do
    first_name { "Employee" }
    last_name { "User" }
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    confirmed_at { Date.yesterday }
  end

  factory :supervisor_user, class: User do
    first_name { "Supervisor" }
    last_name { "User" }
    role { :supervisor }
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    confirmed_at { Date.yesterday }
  end

  factory :admin_user, class: User do
    first_name { "Admin" }
    last_name { "User" }
    role { :admin }
    email { generate :email }
    password { "helloworld" }
    password_confirmation { "helloworld" }
    confirmed_at { Date.yesterday }
  end
end