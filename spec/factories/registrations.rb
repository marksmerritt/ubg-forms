FactoryBot.define do
  factory :registration do
    association :user
    association :course
  end
end
