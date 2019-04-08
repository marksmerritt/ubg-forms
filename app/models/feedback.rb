class Feedback < ApplicationRecord
  enum status: { unresolved: 0, resolved: 1 }

  validates_presence_of :title, :description
end
