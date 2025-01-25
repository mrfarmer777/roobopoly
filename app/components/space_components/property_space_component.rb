# frozen_string_literal: true
module SpaceComponents
  class PropertySpaceComponent < SpaceComponent
    attr_reader :name, :position, :player_names, :color

    def initialize(name:, position:, player_names: nil, color: nil)
      super(name:, position:, player_names:)
      @color = color
    end

  end
end
