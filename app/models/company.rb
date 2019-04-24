class Company < ApplicationRecord
  enum level: { sub: 0, top: 1 }

  has_many :users
  has_many :forms
end
