class FormField < ApplicationRecord
  FIELD_TYPE_OPTIONS = %w(text_field text_area).freeze

  belongs_to :form_type

  validates_presence_of :name
  validates :field_type, inclusion: FIELD_TYPE_OPTIONS, unless: :checklist_field

  before_save :downcase_name


  def downcase_name
    self.name.downcase!
  end

  def checklist_field
    type == "ChecklistFormField"
  end
end
