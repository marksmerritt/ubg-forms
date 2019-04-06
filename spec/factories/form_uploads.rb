FactoryBot.define do
  factory :form_upload do
    association :form_type
    association :user
  end
end
