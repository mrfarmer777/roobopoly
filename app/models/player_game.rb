class PlayerGame < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player_id, uniqueness: { scope: :game_id }

  MAX_SPACES = 40

  def increment_position(amount)
    self.position += amount
    self.position -= MAX_SPACES if self.position > MAX_SPACES
  end
end