FactoryBot.define do
  factory :checklist do
    association :checklist_type
    properties { 
                  { 
                    col1: { row1: "val11", row2: "val12", row3: "val13" },
                    col2: { row1: "val21", row2: "val22", row3: "val23" },
                    col3: { row1: "val31", row2: "val32", row3: "val33" } 
                  } 
               }
  end
end
