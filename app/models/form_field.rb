class FormField < ApplicationRecord
  FIELD_TYPE_OPTIONS = %w(text_field text_area check_box).freeze

  belongs_to :form_type

  validates_presence_of :name, :field_type
  validates :field_type, inclusion: FIELD_TYPE_OPTIONS
end
