# frozen_string_literal: true
module SpaceComponents
  class UtilitySpaceComponent < SpaceComponent
    attr_reader :name, :position, :user_names, :color

    def initialize(name:, position:, user_names: nil)
      super(name:, position:, user_names:)
    end

  end
end
