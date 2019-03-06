FactoryBot.define do
  factory :checklist_type do
    name { "PassFail" }
    rows { ["row1", "row2", "row3"] }
    cols { ["col1", "col2", "col3"] }
  end
end
