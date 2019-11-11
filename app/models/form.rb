class Form < ApplicationRecord
  after_create :check_for_failures

  has_many_attached :images
  
  belongs_to :company
  belongs_to :form_type
  belongs_to :user

  
  validates_presence_of :job_number
  # validate :all_fields_present
  validate :image_limit


  # There is no need to check for incomplete fields. If this changes, simply uncomment the all_fields_present method and the validate :all_fields_present call.  

  # def all_fields_present
  #   if has_empty_fields?(header_properties) || (form_type.has_checklist? && has_empty_fields?(checklist_properties)) || has_empty_fields?(footer_properties)
  #     errors.add(:base, "Please fill out all fields")
  #   end
  # end

  def has_empty_fields?(fields)
    fields.values.any?{ |field| field.empty? }
  end

  def check_for_failures
    update(has_failures: has_a_failure?)
  end

  def has_a_failure?
    checklist_properties.values.any?{ |val| val == "fail" }
  end

  def image_limit
    if images.attached?
      errors.add(:base, "Exceeded maximum number of images (5)") if images.length > 5
    end
  end

  def prepend_job_number(company_prepend)
    update(job_number: job_number.prepend("#{company_prepend}-"))
  end
end
