class Property < ApplicationRecord
  belongs_to :property_space
  belongs_to :owner, class_name: 'PlayerGame', optional: true

  validates :property_space,
            :price,
            :base_rent,
            presence: true

end
