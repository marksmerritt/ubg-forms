FactoryBot.define do
  factory :form do
    association :form_type
    association :user
    header_properties { { site: "some place" } }
    checklist_properties { { tires: false } }
    footer_properties { { date: "11 March 2019" } }
  end
end
