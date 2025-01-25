# frozen_string_literal: true
module SpaceComponents
  class JailSpaceComponent < SpaceComponent
    attr_reader :name, :position, :player_names, :color

    def initialize(name:, position:, player_names: nil)
      super(name:, position:, player_names:)
    end

  end
end
