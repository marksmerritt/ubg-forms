FactoryBot.define do
  factory :course do
    title { "Scaffold 101" }
    body { "This is a course about scaffolds" }
    status { "active" }
  end
end
