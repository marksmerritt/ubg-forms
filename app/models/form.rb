class Form < ApplicationRecord
  has_many_attached :images
  
  belongs_to :form_type
  belongs_to :user
end
