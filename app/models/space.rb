class Space < ApplicationRecord
  belongs_to :game

  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 36 }
end
