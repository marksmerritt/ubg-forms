FactoryBot.define do
  factory :feedback do
    association :user
    title { "MyString" }
    description { "MyText" }
  end
end
