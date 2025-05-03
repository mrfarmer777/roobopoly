# frozen_string_literal: true
module SpaceComponents
  class PropertySpaceComponent < SpaceComponent
    attr_reader :name, :position, :user_names, :color, :price

    def initialize(name:, position:, price:, user_names: nil, color: nil)
      super(name:, position:, user_names:)
      @color = color
      @price = price
    end
  end
end
