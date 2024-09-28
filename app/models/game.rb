class Game < ApplicationRecord

  has_many :player_games
  has_many :players, through: :player_games
  has_many :spaces, dependent: :destroy

  DEFAULT_BOARD_PROPERTIES = Rails.configuration.x.default_board[:spaces]

  validates :players, presence: true
  validate :minimum_players

  def increment_turn
    self.turn += 1
  end

  def initialize_spaces
    DEFAULT_BOARD_PROPERTIES.each_with_index do |space|
        self.spaces.create(position: space[:position], name: space[:name])
    end
  end

  private

  def minimum_players
    errors.add(:players, "must have at least 2 players") if players.size < 2
  end
end
