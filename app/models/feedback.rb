class Feedback < ApplicationRecord
  enum status: { unresolved: 0, resolved: 1 }

  belongs_to :user

  validates_presence_of :title, :description
end
