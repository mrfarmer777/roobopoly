# frozen_string_literal: true

class SpaceComponentPreview < ViewComponent::Preview
  def default
    render(SpaceComponent.new(name: 'Aardvark Boulevard', position: 1, player_names: ['Shackleford']))
  end
end
