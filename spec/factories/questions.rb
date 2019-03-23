FactoryBot.define do
  factory :question do
    title { "MyString" }
    answer_bank { "" }
    correct_answer { "MyString" }
    status { false }
  end
end
