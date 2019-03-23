class Question < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  belongs_to :exam, dependent: :destroy

  validates_presence_of :title, :correct_answer, :answer_bank
end
