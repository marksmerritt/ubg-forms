FactoryBot.define do
  factory :form_type do
    name { "Random Type" }
    association :form_category
  end

  factory :scaffold_form_type, class: FormType do
    name { "Scaffold Inspection" }
    association :form_category
  end

  factory :forklift_form_type, class: FormType do
    name { "Forklift Inspection" }
    association :form_category
  end
end
