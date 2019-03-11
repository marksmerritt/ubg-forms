class Form < ApplicationRecord
  belongs_to :form_type
  belongs_to :user
end
