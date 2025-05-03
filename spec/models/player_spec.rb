require 'rails_helper'

describe Player, type: :model do
  let(:user_one) { User.create(name: "User 1") }
  let(:user_two) { User.create(name: "User 2") }
  let(:game) { Game.create(users: [user_one, user_two]) }
  let(:subject) { described_class.new(user: user_one, game:) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:game) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:game_id) }
  end

  describe '#increment_position' do
    let(:player_one) { game.players.first }
    let(:player_two) { game.players.second }

    it 'increments the position by the given amount' do
      player_one.increment_position(5)
      expect(player_one.reload.position).to eq(6)
    end

    it 'loops back to 1 when the position exceeds 40' do
      player_one.update(position: 39)
      player_one.increment_position(5)
      expect(player_one.reload.position).to eq(4)
    end
  end
end