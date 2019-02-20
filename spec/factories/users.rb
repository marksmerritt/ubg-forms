FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
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