require 'faker'

# -------------------- Reset --------------------

Registration.delete_all
Question.delete_all
Exam.delete_all
Course.delete_all
Form.delete_all
FormUpload.delete_all
FormField.delete_all
FormType.delete_all
User.delete_all

# -------------------- Users --------------------

employee_user = User.new(
  first_name: "Employee",
  last_name: "User", 
  role: :employee,
  email: "employee@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

employee_user.skip_confirmation!
employee_user.save!
employee_user.update(created_at: Faker::Date.between(20.days.ago, Date.today))


supervisor_user = User.new(
  first_name: "Supervisor",
  last_name: "User", 
  role: :supervisor,
  email: "supervisor@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

supervisor_user.skip_confirmation!
supervisor_user.save!
supervisor_user.update(created_at: Faker::Date.between(20.days.ago, Date.today))

admin_user = User.new(
  first_name: "Admin",
  last_name: "User", 
  role: :admin,
  email: "admin@example.com",
  password: "helloworld",
  password_confirmation: "helloworld"
)

admin_user.skip_confirmation!
admin_user.save!
admin_user.update(created_at: Faker::Date.between(20.days.ago, Date.today))

@users = User.all

puts "#{User.count} Users created"


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


# BOOM_SCISSOR_INSPECTION_HEADER_FIELDS = [].freeze
BOOM_SCISSOR_INSPECTION_CHECKLIST_FIELDS = ["Guards", "Ground and platform controls", "Emergency Stop Button",
                                            "Structural damage", "Cracked welds", "Decal-Placard legibility",
                                            "Missing decals/placards", "Operation manual", "ANSI Safety Manual",
                                            "Battery and Battery Compartment", "Hydraulic Oil Level", "Hydraulic Leaks",
                                            "Fire Extinguisher", "Engine Oil Level", "Engine Oil Leaks", "Backup Alarm"].freeze

# BOOM_SCISSOR_INSPECTION_FOOTER_FIELDS = [].freeze


# BOOM_SCISSOR_INSPECTION_HEADER_FIELDS.each do |field|
#   HeaderFormField.create!(
#     name: field,
#     field_type: "text_field",
#     required: true,
#     form_type: FormType.where(name: "Swing Scaffold Inspection")
#   )
# end

BOOM_SCISSOR_INSPECTION_CHECKLIST_FIELDS.each do |field|
  ChecklistFormField.create!(
    name: field,
    field_type: "check_box",
    required: true,
    form_type: FormType.where(name: "Boom-Scissor Inspection").first
  )
end

# BOOM_SCISSOR_INSPECTION_FOOTER_FIELDS.each do |field|
#   FooterFormField.create!(
#     name: field,
#     field_type: "text_field",
#     required: true,
#     form_type: FormType.where(name: "Swing Scaffold Inspection")
#   )
# end



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

# MIXER_INSPECTION_FOOTER_FIELDS = [].freeze


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

# MIXER_INSPECTION_FOOTER_FIELDS.each do |field|
#   FooterFormField.create!(
#     name: field,
#     field_type: "text_field",
#     required: true,
#     form_type: FormType.where(name: "Mixer Inspection")
#   )
# end


# -------------------- Ladder Inspection Fields ---------------------


# LADDER_INSPECTION_HEADER_FIELDS = [].freeze

LADDER_INSPECTION_CHECKLIST_FIELDS = ["Damage to Rails", "Rungs Damaged or Missing", "Feet Damaged or Missing",
                                      "Pulley Damaged or Missing", "Rope Damaged or Missing", "Ladder at Correct Angle",
                                      "Ladder 3 ft. Minimum Above Walk Boards", "Ladder Tied Off"].freeze

LADDER_INSPECTION_FOOTER_FIELDS = ["Qualified Person", "Competent Person"].freeze


# LADDER_INSPECTION_HEADER_FIELDS.each do |field|
#   HeaderFormField.create!(
#     name: field,
#     field_type: "text_field",
#     required: true,
#     form_type: FormType.where(name: "Mast Climber Work Platform Scaffold Inspection")
#   )
# end

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


ACCIDENT_INFO_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Request For Accident Information").first
  )
end


# -------------------- Safety Notice Fields ---------------------


SAFETY_NOTICE_INSPECTION_HEADER_FIELDS = ["Employee", "Employer", "Description of Violation"].freeze


SAFETY_NOTICE_INSPECTION_HEADER_FIELDS.each do |field|
  HeaderFormField.create!(
    name: field,
    field_type: "text_field",
    required: true,
    form_type: FormType.where(name: "Safety Notice").first
  )
end


# -------------------- Form Fields --------------------

# field_type_options = FormField::FIELD_TYPE_OPTIONS

# 50.times do 
#   HeaderFormField.create!(
#     name: Faker::Lorem.word,
#     field_type: field_type_options.sample,
#     required: Faker::Boolean.boolean,
#     form_type: @form_types.sample
#   )
# end

# 50.times do 
#   ChecklistFormField.create!(
#     name: Faker::Lorem.word,
#     field_type: "check_box",
#     required: Faker::Boolean.boolean,
#     form_type: @form_types.sample
#   )
# end

# 50.times do 
#   FooterFormField.create!(
#     name: Faker::Lorem.word,
#     field_type: field_type_options.sample,
#     required: Faker::Boolean.boolean,
#     form_type: @form_types.sample
#   )
# end

# @form_fields = FormField.all

# puts "#{FormField.count} Form Fields created"


# -------------------- Forms --------------------------

# 1000.times do 
#   @form_type = @form_types.sample
#   @header_properties = {}
#   @checklist_properties = {}
#   @footer_properties = {}

#   @form_type.fields.each do |field|
#     if field.type == "HeaderFormField"
#       @header_properties[field.name] = Faker::Lorem.word
#     elsif field.type == "FooterFormField"
#       @footer_properties[field.name] = Faker::Lorem.word
#     else
#       @checklist_properties[field.name] = ["pass","fail"].sample
#     end
#   end

#   @form = Form.create!(
#     form_type: @form_type,
#     user: @users.sample,
#     header_properties: @header_properties,
#     checklist_properties: @checklist_properties,
#     footer_properties: @footer_properties,
#     job_number: Faker::Code.nric
#   )

#   @form.update(updated_at: Faker::Date.between(20.days.ago, Date.today))
# end

# @forms = Form.all

# puts "#{Form.count} Forms created"



# -------------------- Active Courses --------------------------

YOUTUBE_IDS = ["Z3pD02Qw7Xg", "Y3J8dt7OvyQ", "m0sgigLof24"].freeze

100.times do 
  Course.create!(
    title: Faker::Educator.subject,
    body: Faker::Lorem.paragraph_by_chars(1000, false),
    status: "active",
    youtube_id: YOUTUBE_IDS.sample
  )
end

@courses = Course.all

puts "#{Course.count} Courses created"



# -------------------- Exams --------------------------

@courses.each do |course|
  Exam.create!(
    instructions: Faker::Lorem.sentence,
    course: course
  )
end

@exams = Exam.all

puts "#{Exam.count} Exams created"



# -------------------- Questions --------------------------

@exams.each do |exam|
  10.times do 
    @answer_bank = []
    4.times { @answer_bank.push(Faker::Lorem.sentence) }

    Question.create!(
      title: Faker::Lorem.sentence,
      answer_bank: @answer_bank,
      correct_answer: [0,1,2,3].sample,
      status: "active",
      exam: exam
    )
  end
end

@questions = Question.all

puts "#{Question.count} Questions created"


# -------------------- Registrations --------------------------

# Register Users for all courses (for now)

@users.each do |user|
  @courses.each do |course|
    Registration.create!(
      user: user,
      course: course
    )
  end
end

@registrations = Registration.all

puts "#{Registration.count} Registrations created"
















