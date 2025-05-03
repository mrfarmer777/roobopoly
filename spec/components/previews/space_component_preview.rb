# frozen_string_literal: true

class SpaceComponentPreview < ViewComponent::Preview
  def default
    render(SpaceComponent.new(name: 'Aardvark Boulevard',
                              position: 1,
                              user_names: ['Shackleford']))
  end
end
