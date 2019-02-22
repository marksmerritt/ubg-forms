FactoryBot.define do
  factory :form_type do
    name { "Random Type" }
  end

  factory :scaffold_form_type, class: FormType do
    name { "Scaffold Inspection" }
  end

  factory :forklift_form_type, class: FormType do
    name { "Forklift Inspection" }
  end
end
