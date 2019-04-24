FactoryBot.define do
  factory :form do
    association :company
    association :form_type
    association :user
    job_number { "1234" }
    header_properties { { site: "some place" } }
    checklist_properties { { tires: false } }
    footer_properties { { date: "11 March 2019" } }
  end
end
