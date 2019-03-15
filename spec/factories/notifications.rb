FactoryBot.define do
  factory :notification do
    recipient_id { 1 }
    actor_id { 1 }
    read_at { "2019-03-15 15:14:46" }
    action { "MyString" }
    notifiable_id { 1 }
    notifiable_type { "MyString" }
  end
end
