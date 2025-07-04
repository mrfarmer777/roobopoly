class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :properties, foreign_key: :owner_id

  validates :user_id, uniqueness: { scope: :game_id }

  after_update :broadcast_game_update

  MAX_POSITION = Rails.configuration.x.default_board[:spaces].size

  def increment_position(amount)
    update(position: (self.position + amount) % MAX_POSITION)
  end

  def broadcast_game_update
    broadcast_replace_to(game,
                         target: "game_#{game_id}",
                         template: 'games/show',
                         locals: { game: game, current_player: game.current_player })
  end
end