class PlayerGame < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player_id, uniqueness: { scope: :game_id }

  after_update :broadcast_game_update

  MAX_POSITION = Rails.configuration.x.default_board[:spaces].size

  def increment_position(amount)
    update(position: (self.position + amount) % MAX_POSITION)
  end

  def broadcast_game_update
    broadcast_replace_to(game,
                         target: "game_#{game_id}",
                         template: 'games/show',
                         locals: { game: game, current_player_game: game.current_player_game })
  end
end