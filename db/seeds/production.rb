require 'faker'

# -------------------- Reset --------------------

Form.delete_all
FormUpload.delete_all
FormField.delete_all
FormType.delete_all




# -------------------- Form Types ---------------------

FORM_TYPES = ["Forklift Inspection", "Tube Scaffold Inspection", "Swing Scaffold Inspection", "Boom-Scissor Inspection",
              "Mast Climber Work Platform Scaffold Inspection", "Mixer Inspection", 
              "Ladder Inspection", "Request For Accident Information", "Safety Notice"].freeze

FORM_TYPES.each do |form_type|
  FormType.create!(
    name: form_type
  )
end

@form_types = FormType.all

puts "#{FormType.count} Form Types created"



# -------------------- Forklift Inspection Fields ---------------------


FORKLIFT_INSPECTION_HEADER_FIELDS = ["Machine Number/SN", "Hours/Mileage"].freeze
FORKLIFT_INSPECTION_CHECKLIST_FIELDS = ["Engine Oil", "Parking Brake", "Service Brake", "Front Horn",
                                        "Reverse Beeper", "Hydraulic Leaks", "Fire Extinguisher",
                                        "Seat Belt", "Tires", "Lug Nuts", "Mirrors", "Step",
                                        "Rear Warning Light", "Load Chart", "Level and Boom Angle Indicators",
                                        "Boom Extension #/Letter", "Boom Chain (8-44 and 10-44 only)"].freeze

FORKLIFT_INSPECTION_FOOTER_FIELDS = ["Operator"].freeze


FORKLIFT_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Forklift Inspection").first
  )
end

FORKLIFT_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Forklift Inspection").first
  )
end

FORKLIFT_INSPECTION_FOOTER_FIELDS.each do |field|
  FooterFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Forklift Inspection").first
  )
end




# -------------------- Tube Scaffold Inspection Fields ---------------------


TUBE_SCAFFOLD_INSPECTION_HEADER_FIELDS = ["Scaffold Elevation and Column Line"].freeze

TUBE_SCAFFOLD_INSPECTION_CHECKLIST_FIELDS = ["Still Boards", "Base Plates", "Screw Jacks", "Braces",
                                             "Toggle Pins", "Side Brackets", "Walk Boards", "Material Plank",
                                             "Guard Post", "Guard Rails", "Toe Boards", "End Rails", "Stiff Arms",
                                             "Access Ladder"].freeze

TUBE_SCAFFOLD_INSPECTION_FOOTER_FIELDS = ["Qualified Person", "Competent Person"].freeze


TUBE_SCAFFOLD_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Tube Scaffold Inspection").first
  )
end

TUBE_SCAFFOLD_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Tube Scaffold Inspection").first
  )
end

TUBE_SCAFFOLD_INSPECTION_FOOTER_FIELDS.each do |field|
  FooterFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Tube Scaffold Inspection").first
  )
end



# -------------------- Swing Scaffold Inspection Fields ---------------------


SWING_SCAFFOLD_INSPECTION_HEADER_FIELDS = ["Scaffold Elevation and Column Line"].freeze

SWING_SCAFFOLD_INSPECTION_CHECKLIST_FIELDS = ["Cables", "Hook/Latch", "Cable Eyes", "Cable Ring", "Ring Stops",
                                              "Beams", "Beam Bolts", "Beam Anchors", "Tie Back Cable", 
                                              "Weights", "Support Frames", "Wheel Locks/Chocks"].freeze

SWING_SCAFFOLD_INSPECTION_FOOTER_FIELDS = ["Qualified Person", "Competent Person"].freeze


SWING_SCAFFOLD_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Swing Scaffold Inspection").first
  )
end

SWING_SCAFFOLD_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Swing Scaffold Inspection").first
  )
end

SWING_SCAFFOLD_INSPECTION_FOOTER_FIELDS.each do |field|
  FooterFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Swing Scaffold Inspection").first
  )
end



# -------------------- Boom-Scissor Inspection Fields ---------------------

BOOM_SCISSOR_INSPECTION_CHECKLIST_FIELDS = ["Guards", "Ground and platform controls", "Emergency Stop Button",
                                            "Structural damage", "Cracked welds", "Decal-Placard legibility",
                                            "Missing decals/placards", "Operation manual", "ANSI Safety Manual",
                                            "Battery and Battery Compartment", "Hydraulic Oil Level", "Hydraulic Leaks",
                                            "Fire Extinguisher", "Engine Oil Level", "Engine Oil Leaks", "Backup Alarm"].freeze


BOOM_SCISSOR_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Boom-Scissor Inspection").first
  )
end



# -------------------- Mast Climber Work Platform Scaffold Inspection Fields ---------------------


MAST_CLIMBER_INSPECTION_HEADER_FIELDS = ["Unit #"].freeze

MAST_CLIMBER_INSPECTION_CHECKLIST_FIELDS = ["Cleanliness and general indications of damage", 
                                            "Functioning of controls and safety devices",
                                            "The means for emergency lowering work platform",
                                            "Condition of rack and pinion drive system", 
                                            "Condition of tower guards", 
                                            "Ground Support conditions, including packing beneath stabilizers and sill/cribbing",
                                            "Electric (trailing) cables, load information plates", 
                                            "Work platform gates, guard rails, toe boards and floor",
                                            "Guide rollers between work platform and mast",
                                            "Walk boards and extensions and walk board spacing"].freeze

MAST_CLIMBER_INSPECTION_FOOTER_FIELDS = ["Qualified Person", "Competent Person"].freeze


MAST_CLIMBER_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Mast Climber Work Platform Scaffold Inspection").first
  )
end

MAST_CLIMBER_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Mast Climber Work Platform Scaffold Inspection").first
  )
end

MAST_CLIMBER_INSPECTION_FOOTER_FIELDS.each do |field|
  FooterFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Mast Climber Work Platform Scaffold Inspection").first
  )
end


# -------------------- Mixer Inspection Fields ---------------------


MIXER_INSPECTION_HEADER_FIELDS = ["Machine Number"].freeze

MIXER_INSPECTION_CHECKLIST_FIELDS = ["Engine Oil", "Oil Leaks", "Grate In Place/Damaged",
                                            "Paddle Damage", "Dump Operation"].freeze


MIXER_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Mixer Inspection").first
  )
end

MIXER_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Mixer Inspection").first
  )
end


# -------------------- Ladder Inspection Fields ---------------------

LADDER_INSPECTION_CHECKLIST_FIELDS = ["Damage to Rails", "Rungs Damaged or Missing", "Feet Damaged or Missing",
                                      "Pulley Damaged or Missing", "Rope Damaged or Missing", "Ladder at Correct Angle",
                                      "Ladder 3 ft. Minimum Above Walk Boards", "Ladder Tied Off"].freeze

LADDER_INSPECTION_FOOTER_FIELDS = ["Qualified Person", "Competent Person"].freeze


LADDER_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Ladder Inspection").first
  )
end

LADDER_INSPECTION_FOOTER_FIELDS.each do |field|
  FooterFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Ladder Inspection").first
  )
end


# -------------------- Request For Accident Information Fields ---------------------


ACCIDENT_INFO_INSPECTION_HEADER_FIELDS = ["Company", "Foreman", "SUPER", "Date and Hour of Accident", "Name of Injured",
                                          "Occupation When Injured", "Was the Foreman Informed?", "Date?", "Witness?",
                                          "Third Party Involved?", "Hospitalized?", "Where?", "Clinic?", "Where?",
                                          "Activity EE Was Engaged In", "How Accident Occurred", "Describe Nature of Injury",
                                          "Has Injured Returned To Work?", "Date?"].freeze

ACCIDENT_INFO_TEXT_AREA_FIELDS = ["Activity EE Was Engaged In", "How Accident Occurred", "Describe Nature of Injury"].freeze

ACCIDENT_INFO_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: (ACCIDENT_INFO_TEXT_AREA_FIELDS.include?(field) ? "text_area" : "text_field"),
    required: true,
    form_type: FormType.where(name: "Request For Accident Information").first
  )
end



# -------------------- Safety Notice Fields ---------------------


SAFETY_NOTICE_INSPECTION_HEADER_FIELDS = ["Employee", "Employer", "Description of Violation"].freeze

SAFETY_NOTICE_TEXT_AREA_FIELDS = ["Description of Violation"].freeze

SAFETY_NOTICE_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: (SAFETY_NOTICE_TEXT_AREA_FIELDS.include?(field) ? "text_area" : "text_field"),
    required: true,
    form_type: FormType.where(name: "Safety Notice").first
  )
end


