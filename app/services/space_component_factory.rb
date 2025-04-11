class SpaceComponentFactory
  def self.create(space)
    case space.type
    when 'PropertySpace'
      SpaceComponents::PropertySpaceComponent.new(name: space.name,
                                                  price: space.property.price,
                                                  position: space.position,
                                                  color: space.color)
    when 'ActionSpace'
      SpaceComponents::ActionSpaceComponent.new(name: space.name,
                                                position: space.position)
    when 'UtilitySpace'
      SpaceComponents::UtilitySpaceComponent.new(name: space.name,
                                                 position: space.position)
    when 'TaxSpace'
      SpaceComponents::TaxSpaceComponent.new(name: space.name,
                                             position: space.position)
    when 'JailSpace'
      SpaceComponents::JailSpaceComponent.new(name: space.name,
                                              position: space.position)
    else
      SpaceComponent.new(name: space.name,
                         position: space.position)

    end
  end

end