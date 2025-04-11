require 'rails_helper'

describe SpaceComponentFactory, type: :model do
  describe 'create' do
    it 'creates a PropertySpaceComponent when space type is PropertySpace' do
      space = PropertySpace.new(position: 1, name: "Foo", type: "PropertySpace", color: "blue")
      space.property = Property.new(price: 100, base_rent: 10)
      space_component = SpaceComponentFactory.create(space)
      expect(space_component).to be_a(SpaceComponents::PropertySpaceComponent)
    end

    it 'creates a ActionSpaceComponent when space type is ActionSpace' do
      space = ActionSpace.new(position: 1, name: "Foo", type: "ActionSpace")
      space_component = SpaceComponentFactory.create(space)
      expect(space_component).to be_a(SpaceComponents::ActionSpaceComponent)
    end

    it 'creates a UtilitySpaceComponent when space type is UtilitySpace' do
      space = UtilitySpace.new(position: 1, name: "Foo", type: "UtilitySpace")
      space_component = SpaceComponentFactory.create(space)
      expect(space_component).to be_a(SpaceComponents::UtilitySpaceComponent)
    end

    it 'creates a TaxSpaceComponent when space type is TaxSpace' do
      space = TaxSpace.new(position: 1, name: "Foo", type: "TaxSpace")
      space_component = SpaceComponentFactory.create(space)
      expect(space_component).to be_a(SpaceComponents::TaxSpaceComponent)
    end

    it 'creates a JailSpaceComponent when space type is JailSpace' do
      space = JailSpace.new(position: 1, name: "Foo", type: "JailSpace")
      space_component = SpaceComponentFactory.create(space)
      expect(space_component).to be_a(SpaceComponents::JailSpaceComponent)
    end
  end
end