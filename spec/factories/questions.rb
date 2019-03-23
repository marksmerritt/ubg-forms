FactoryBot.define do
  factory :question do
    title { "What's your name?" }
    answer_bank { ["Answer1", "Answer2", "Answer3", "Answer4"] }
    correct_answer { 1 }
    status { "active" }
    association :exam
  end

  factory :question2, class: Question do
    title { "How old are you?" }
    answer_bank { ["Answer1", "Answer2", "Answer3", "Answer4"] }
    correct_answer { 1 }
    status { "active" }
    association :exam
  end
end
