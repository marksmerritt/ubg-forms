json.array! @notifications do |notification|
  json.actor notification.actor.first_name
  json.action notification.action
  json.notifiable do 
    json.type "a #{notification.notifiable.form_type.name} Form"
  end
  json.url form_type_form_path(notification.notifiable.form_type, notification.notifiable)
end