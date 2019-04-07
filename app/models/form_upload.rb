class FormUpload < ApplicationRecord
  belongs_to :user
  belongs_to :form_type

  has_one_attached :form

  # Job number is required to build Azure filename
  # for form uploads to keep them in the same dir
  # structure as other forms. 
  # DO NOT REMOVE THIS FIELD
  validates_presence_of :form, :job_number
end
