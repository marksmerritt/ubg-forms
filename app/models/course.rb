class Course < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  validates_presence_of :title, :body
end
