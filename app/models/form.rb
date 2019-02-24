class Form < ApplicationRecord
  belongs_to :form_type
  belongs_to :user

  validate :required_properties_present

  def required_properties_present
    form_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must be provided"
      end
    end
  end
end
