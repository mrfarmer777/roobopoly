require 'rails_helper'

describe PlayerGame, type: :model do
  describe 'associations' do
    it { should belong_to(:player) }
    it { should belong_to(:game) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:player_id).scoped_to(:game_id) }
  end

  describe '#increment_position' do
    let(:player) { Player.create(name: "Player 1") }
    let(:game) { Game.create }

    it 'increments the position by the given amount' do
      player_game = PlayerGame.new(position: 1, player:, game:)
      player_game.increment_position(5)
      expect(player_game.position).to eq(6)
    end

    it 'loops back to 1 when the position exceeds 40' do
      player_game = PlayerGame.new(position: 39, player:, game:)
      player_game.increment_position(5)
      expect(player_game.position).to eq(4)
    end
  end
end