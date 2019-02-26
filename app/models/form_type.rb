class FormType < ApplicationRecord
  has_many :forms

  has_many :fields, class_name: "FormField", dependent: :destroy
  accepts_nested_attributes_for :fields, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  validates :name, presence: true, uniqueness: true

  def valid_fields
    fields.pluck(:name).map(&:to_sym)
  end
end
