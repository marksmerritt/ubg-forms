class FormCategory < ApplicationRecord
  has_many :form_types

  validates_presence_of :name
end
