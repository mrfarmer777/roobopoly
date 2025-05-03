require 'rails_helper'

describe UserGame, type: :model do
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
    let(:user_game_one) { game.user_games.first }
    let(:user_game_two) { game.user_games.second }

    it 'increments the position by the given amount' do
      user_game_one.increment_position(5)
      expect(user_game_one.reload.position).to eq(6)
    end

    it 'loops back to 1 when the position exceeds 40' do
      user_game_one.update(position: 39)
      user_game_one.increment_position(5)
      expect(user_game_one.reload.position).to eq(4)
    end
  end
end