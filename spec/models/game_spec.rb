require 'rails_helper'

describe Game, type: :model do
  describe 'associations' do
    it { should have_many(:player_games) }
    it { should have_many(:players).through(:player_games) }
    it { should have_many(:spaces) }
  end

  it 'initializes with a turn of 1' do
    expect(Game.new.turn).to eq(1)
  end

  describe '#increment_turn' do
    it 'increments the turn by 1' do
      game = Game.new
      game.increment_turn
      expect(game.turn).to eq(2)
    end
  end
end