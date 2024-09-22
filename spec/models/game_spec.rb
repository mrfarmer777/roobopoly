require 'rails_helper'

describe Game, type: :model do
  describe 'associations' do
    it { should have_many(:player_games) }
    it { should have_many(:players).through(:player_games) }
    it { should have_many(:spaces) }

    it 'destroys all related spaces when destroyed' do
      game = Game.create
      other_game = Game.create
      game.spaces.create(position: 1, name: "Go")
      game.spaces.create(position: 2, name: "Free Parking")
      game.spaces.create(position: 3, name: "Boardwalk")
      other_game.spaces.create(position: 1, name: "Go")
      game.destroy
      expect(Space.count).to eq(1)
    end
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

  describe '#initialize_spaces' do
    let(:game) { Game.create }
    it 'creates 3 spaces' do
      game.initialize_spaces
      expect(game.spaces.count).to eq(3)
    end

    it 'creates spaces with names loaded from default board' do
      game.initialize_spaces
      game.reload
      expect(game.spaces.first.name).to eq("Go")
      expect(game.spaces.second.name).to eq("Free Parking")
      expect(game.spaces.last.name).to eq("Boardwalk")
    end

  end
end