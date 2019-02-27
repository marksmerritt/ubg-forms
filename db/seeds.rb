require 'faker'

# -------------------- Reset --------------------


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


50.times do 
  employee_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name, 
    role: :employee,
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld"
  )
  employee_user.skip_confirmation!
  employee_user.save!
end

@users = User.all

puts "#{User.count} Users created"


# -------------------- Form Types ---------------------

form_types = ["Scaffold Inspection", "Forklift Inspection", "Boom/Scissor Inspection",
              "Daily Mast Climber Work Platform Scaffold Check List", "Mixer Inspection",
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

500.times do 
  @form_type = @form_types.sample
  @properties = {}

  @form_type.fields.each do |field|
    if field.field_type == "text_field"
      @properties[field.name] = Faker::Lorem.word
    elsif field.field_type == "text_area"
      @properties[field.name] = Faker::Lorem.sentence
    elsif field.field_type == "check_box"
      @properties[field.name] = [0,1].sample
    end
  end

  Form.create!(
    form_type: @form_type,
    user: @users.sample,
    properties: @properties
  )
end

@forms = Form.all

puts "#{Form.count} Forms created"































