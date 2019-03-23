class Course < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  has_many :registrations
  has_many :users, through: :registrations
  has_one :exam

  validates_presence_of :title, :body
end
