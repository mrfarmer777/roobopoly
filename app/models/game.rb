class Game < ApplicationRecord

  has_many :player_games
  has_many :players, through: :player_games

  def increment_turn
    self.turn += 1
  end
end
