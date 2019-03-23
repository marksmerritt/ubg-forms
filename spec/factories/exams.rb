FactoryBot.define do
  factory :exam do
    instructions { "You will have 10 minutes to complete this exam." }
    association :course
  end
end
