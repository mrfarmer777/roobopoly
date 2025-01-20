class Space < ApplicationRecord
  belongs_to :game

  validates :name,
            :position,
            presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validate :color_is_hex, if: -> { color.present? }

  private

  def color_is_hex
    errors.add(:color, "is not a valid hex color") unless color.match?(/\A#(?:[0-9a-fA-F]{3}){1,2}\z/)
  end
end
