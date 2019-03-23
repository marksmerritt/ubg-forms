class Question < ApplicationRecord
  belongs_to :exam, dependent: :destroy
end
