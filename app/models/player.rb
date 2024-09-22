class Player < ApplicationRecord
  validates :name, presence: true
  # has_many :games
  # has_many :player_games
  # has_many :games, through: :player_games
end
