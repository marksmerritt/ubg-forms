FactoryBot.define do
  factory :form_upload do
    association :form_type
    association :user
    job_number { "1234" }
  end
end
