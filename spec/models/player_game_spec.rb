require 'rails_helper'

describe PlayerGame, type: :model do
  let(:player_one) { Player.create(name: "Player 1") }
  let(:player_two) { Player.create(name: "Player 2") }
  let(:game) { Game.create(players: [player_one, player_two]) }
  let(:subject) { described_class.new(player: player_one, game:) }

  describe 'associations' do
    it { should belong_to(:player) }
    it { should belong_to(:game) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:player_id).scoped_to(:game_id) }
  end

  describe '#increment_position' do
    let(:player_game_one) { game.player_games.first }
    let(:player_game_two) { game.player_games.second }

    it 'increments the position by the given amount' do
      player_game_one.increment_position(5)
      expect(player_game_one.reload.position).to eq(6)
    end

    it 'loops back to 1 when the position exceeds 40' do
      player_game_one.update(position: 39)
      player_game_one.increment_position(5)
      expect(player_game_one.reload.position).to eq(4)
    end
  end
end