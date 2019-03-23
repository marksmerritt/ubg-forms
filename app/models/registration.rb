class Registration < ApplicationRecord
  enum status: { incomplete: 0, completed: 1 }

  belongs_to :user
  belongs_to :course
end
