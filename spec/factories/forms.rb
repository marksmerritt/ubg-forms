FactoryBot.define do
  factory :form do
    association :form_type
    association :user
    properties { { tires: false } }
  end
end
