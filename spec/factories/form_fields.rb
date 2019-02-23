FactoryBot.define do
  factory :form_field do
    name { "MyString" }
    field_type { "text_field" }
    required { false }
    association :form_type
  end
end
