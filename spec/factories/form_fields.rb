FactoryBot.define do
  factory :form_field do
    name { "tires" }
    field_type { "text_field" }
    required { false }
    association :form_type
  end

  factory :required_form_field, class: FormField do
    name { "winch" }
    field_type { "text_field" }
    required { true }
    association :form_type
  end
end
