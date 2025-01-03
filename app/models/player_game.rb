class PlayerGame < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player_id, uniqueness: { scope: :game_id }

  MAX_POSITION = Rails.configuration.x.default_board[:spaces].size

  def increment_position(amount)
    update(position: (self.position + amount) % MAX_POSITION)
  end
end