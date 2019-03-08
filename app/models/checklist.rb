class Checklist < ApplicationRecord
  belongs_to :checklist_type, dependent: :destroy
  belongs_to :form, dependent: :destroy
end
