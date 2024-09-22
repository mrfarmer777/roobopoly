class Game < ApplicationRecord

  def increment_turn
    self.turn += 1
  end
end
