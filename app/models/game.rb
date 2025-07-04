class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :spaces, dependent: :destroy

  DEFAULT_BOARD_PROPERTIES = Rails.configuration.x.default_board[:spaces]

  validates :users, presence: true
  validate :minimum_users

  def increment_turn
    update(turn: turn + 1)
  end

  def current_player
    return nil if players.empty?

    player_index = (turn % players.size) - 1
    players.sort[player_index]
  end

  def initialize_spaces
    DEFAULT_BOARD_PROPERTIES.each_with_index do |space|
      space_record = Space.create(position: space[:position],
                                  type: space[:type],
                                  name: space[:name],
                                  color: space[:color])
      self.spaces << space_record
      if space_record.valid? && space_record.is_a?(PropertySpace)
        space_record.create_property!(price: space[:purchase_price],
                                      base_rent: space[:rent])
      end
    end
  end

  def player_can_purchase_current_space?(player)
    current_space = spaces.find_by(position: player.position)
    return false unless current_space.is_a?(PropertySpace)

    property = current_space.property
    return false if property.nil? || property.owner.present?

    player.money >= property.price
  end

  private

  def minimum_users
    errors.add(:users, "must have at least 2 users") if users.size < 2
  end


end
