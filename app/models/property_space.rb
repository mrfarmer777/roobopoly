class PropertySpace < Space
  has_one :property, dependent: :destroy

  validate :color_is_hex, if: -> { color.present? }

  private

  def color_is_hex
    errors.add(:color, "is not a valid hex color") unless color.match?(/\A#(?:[0-9a-fA-F]{3}){1,2}\z/)
  end
end
