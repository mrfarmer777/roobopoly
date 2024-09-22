class Game < ApplicationRecord

  has_many :player_games
  has_many :players, through: :player_games
  has_many :spaces, dependent: :destroy

  DEFAULT_BOARD_SPACES = Rails.configuration.x.default_board[:spaces]

  def increment_turn
    self.turn += 1
  end

  def initialize_spaces
    DEFAULT_BOARD_SPACES.each_with_index do |space, index|
        self.spaces.create(position: index + 1, name: space[:name])
    end
  end
end
