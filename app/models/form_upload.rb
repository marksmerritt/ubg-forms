class FormUpload < ApplicationRecord
  belongs_to :user
  belongs_to :form_type

  has_one_attached :form
end
