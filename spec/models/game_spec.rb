require 'rails_helper'

describe Game, type: :model do
  it 'is a thing' do
    expect(Game.new).to be_a(Game)
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