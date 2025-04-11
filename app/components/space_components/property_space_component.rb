# frozen_string_literal: true
module SpaceComponents
  class PropertySpaceComponent < SpaceComponent
    attr_reader :name, :position, :player_names, :color, :price

    def initialize(name:, position:, price:, player_names: nil, color: nil)
      super(name:, position:, player_names:)
      @color = color
      @price = price
    end
  end
end
