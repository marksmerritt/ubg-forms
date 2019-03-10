class FormType < ApplicationRecord
  FIELD_TYPES = [:fields, :header_fields, :checklist_fields, :footer_fields].freeze

  has_many :forms

  has_many :fields, class_name: "FormField", dependent: :destroy
  has_many :header_fields, class_name: "HeaderFormField", dependent: :destroy
  has_many :checklist_fields, class_name: "ChecklistFormField", dependent: :destroy
  has_many :footer_fields, class_name: "FooterFormField", dependent: :destroy

  FIELD_TYPES.each do |type|
    accepts_nested_attributes_for type, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }  
  end

  validates :name, presence: true, uniqueness: true

  def valid_fields
    fields.pluck(:name).map(&:to_sym)
  end
end
