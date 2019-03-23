require 'faker'

# -------------------- Reset --------------------

Registration.delete_all
Exam.delete_all
Course.delete_all
Form.delete_all
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

@users = User.all

puts "#{User.count} Users created"


# -------------------- Form Types ---------------------

form_types = ["Scaffold Inspection", "Forklift Inspection", "Boom/Scissor Inspection",
              "Mast Climber Inspection", "Mixer Inspection",
              "Ladder Inspection", "Request For Accident Information", "Job Hazard Analysis"]

form_types.each do |form_type|
  FormType.create!(
    name: form_type
  )
end

@form_types = FormType.all

puts "#{FormType.count} Form Types created"


# -------------------- Form Fields --------------------

field_type_options = FormField::FIELD_TYPE_OPTIONS

50.times do 
  HeaderFormField.create!(
    name: Faker::Lorem.word,
    field_type: field_type_options.sample,
    required: Faker::Boolean.boolean,
    form_type: @form_types.sample
  )
end

50.times do 
  ChecklistFormField.create!(
    name: Faker::Lorem.word,
    field_type: "check_box",
    required: Faker::Boolean.boolean,
    form_type: @form_types.sample
  )
end

50.times do 
  FooterFormField.create!(
    name: Faker::Lorem.word,
    field_type: field_type_options.sample,
    required: Faker::Boolean.boolean,
    form_type: @form_types.sample
  )
end

@form_fields = FormField.all

puts "#{FormField.count} Form Fields created"


# -------------------- Forms --------------------------

1000.times do 
  @form_type = @form_types.sample
  @header_properties = {}
  @checklist_properties = {}
  @footer_properties = {}

  @form_type.fields.each do |field|
    if field.type == "HeaderFormField"
      @header_properties[field.name] = Faker::Lorem.word
    elsif field.type == "FooterFormField"
      @footer_properties[field.name] = Faker::Lorem.word
    else
      @checklist_properties[field.name] = ["pass","fail"].sample
    end
  end

  Form.create!(
    form_type: @form_type,
    user: @users.sample,
    header_properties: @header_properties,
    checklist_properties: @checklist_properties,
    footer_properties: @footer_properties,
    job_number: Faker::Code.nric
  )
end

@forms = Form.all

puts "#{Form.count} Forms created"



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
















