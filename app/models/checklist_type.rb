# TODO: Validate Rows/Cols
class ChecklistType < ApplicationRecord
  has_many :checklists

  def cols=(value)
    super(value.split(",").map(&:strip))
  end

  def rows=(value)
    super(value.split(",").map(&:strip))
  end

  validates_presence_of :name
end
