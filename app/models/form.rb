class Form < ApplicationRecord
  after_create :check_for_failures

  has_many_attached :images
  
  belongs_to :form_type
  belongs_to :user

  validates_presence_of :job_number

  validate :all_fields_present

  def all_fields_present
    if has_empty_fields?(header_properties) || has_empty_fields?(checklist_properties) || has_empty_fields?(footer_properties)
      errors.add(:base, "Please fill out all fields")
    end
  end

  def has_empty_fields?(fields)
    fields.values.any?{ |field| field.empty? }
  end

  def check_for_failures
    update(has_failures: has_a_failure?)
  end

  def has_a_failure?
    checklist_properties.values.any?{ |val| val == "fail" }
  end
end
