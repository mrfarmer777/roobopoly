# frozen_string_literal: true

class SpaceComponent < ViewComponent::Base
  attr_reader :name, :position
  attr_accessor :user_names

  CORNERS = [1, 11, 21, 31]
  TOP_SIDE = (2..10)
  RIGHT_SIDE = (11..20)
  LEFT_SIDE = (32..40)

  def initialize(name:, position:, user_names: nil)
    @name = name
    @position = position
    @user_names = user_names || []
  end

  def rotation
    ((position / 11).floor + 2) * 90
  end

  def classes
    case position
    when *CORNERS
      "space--corner-#{position}"
    when *TOP_SIDE
      "space--top"
    when *RIGHT_SIDE
      "space--right"
    when *LEFT_SIDE
      "space--left"
    else
      "space--bottom"
    end
  end
end
