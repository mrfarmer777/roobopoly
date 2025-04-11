class Game < ApplicationRecord
  has_many :player_games
  has_many :players, through: :player_games
  has_many :spaces, dependent: :destroy

  DEFAULT_BOARD_PROPERTIES = Rails.configuration.x.default_board[:spaces]

  validates :players, presence: true
  validate :minimum_players

  def increment_turn
    update(turn: turn + 1)
  end

  def current_player_game
    return nil if player_games.empty?

    player_game_index = (turn % player_games.size) - 1
    player_games.sort[player_game_index]
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

  private

  def minimum_players
    errors.add(:players, "must have at least 2 players") if players.size < 2
  end


end
