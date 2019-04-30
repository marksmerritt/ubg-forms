require "faker"

# Create Fake Users
FAKE_FIRST_NAMES = ["Tim", "Eric", "Elijah", "Juan", "Miguel", "Austin", "Noah", "Michael", "Rich", "John"]
FAKE_LAST_NAMES = ["McDonald", "Peterson", "Jones", "Martinez", "Hernandez", "Williams", "Miller", "Thompson", "Wilson", "Carpenter"]

10.times do |index| 
  fake_user = User.new(
    first_name: FAKE_FIRST_NAMES[index],
    last_name: FAKE_LAST_NAMES[index], 
    role: :employee,
    email: "#{FAKE_FIRST_NAMES[index].downcase}@ubgforms.com",
    password: "helloworld",
    password_confirmation: "helloworld",
    company: Company.all.sample
  )

  fake_user.skip_confirmation!
  fake_user.save!
end

@users = User.all


# Generate Fake Forms

700.times do |index|
  user = @users.sample
  form = Form.all.sample
  fake_form = form.dup
  fake_form.user = user
  fake_form.form_type = form.form_type
  fake_form.company = user.company 
  fake_form.created_at = Faker::Date.between(2.weeks.ago, Date.today)

  fake_form.save!
end